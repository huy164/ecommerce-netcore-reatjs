using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Back.Models;
using Newtonsoft.Json;
using Microsoft.EntityFrameworkCore;
using System.Text.Json;
using Microsoft.AspNetCore.Authentication;
using Back.ModelDTO;
using Microsoft.AspNetCore.Authorization;

namespace Back.Controllers
{
    // [EnableCors(origins: "*", headers: "accept,content-type,origin,x-my-header", methods: "*")]

    [ApiController]

    //[Authorize(Roles = "STAFF")]
    public class HoadonController : Controller
    {
        private readonly ILogger<HoadonController> _logger;
        lavenderContext lavenderContext;

        public HoadonController(ILogger<HoadonController> logger, lavenderContext lavenderContext)
        {
            _logger = logger;
            this.lavenderContext = lavenderContext;
        }

        [Authorize(Roles = "ADMINISTRATOR, STAFF")]
        [Route("/twenty-hoadon")]
        [HttpGet]
        public async Task<IActionResult> TwentyHoadon()
        {
            var hoadonlist = await (from h in lavenderContext.Hoadon
                                    orderby h.Ngayhoadon descending
                                    select h).OrderByDescending(x => x.Ngayhoadon).Take(20).ToListAsync();
            if (hoadonlist.Count == 0) return StatusCode(404);
            return StatusCode(200, Json(hoadonlist));
        }

        [Authorize(Roles = "ADMINISTRATOR, STAFF")]
        [Route("/hoa-don-dang-xu-ly")]
        [HttpGet]
        public async Task<IActionResult> ProcessingBilling()
        {
            var hoadonlist = await (from h in lavenderContext.Hoadon
                                    select h).OrderByDescending(x => x.Ngayhoadon).Take(20).ToListAsync();
            if (hoadonlist == null || hoadonlist.Count() == 0) return StatusCode(404);
            var newlist = new List<Hoadon>();
            foreach (var i in hoadonlist)
            {

                var e = lavenderContext.Entry(i);
                await e.Collection(x => x.Vanchuyens).LoadAsync();
                foreach (var j in i.Vanchuyens)
                {
                    if (j.Trangthai.Equals("Đang xử lý"))
                    {
                        newlist.Add(i);
                    }
                }
            }
            return StatusCode(200, Json(newlist));
        }

        [Authorize(Roles = "ADMINISTRATOR, STAFF")]
        [Route("/doanh-thu-theo-thang")]
        [HttpGet]
        public async Task<IActionResult> DoanhThuTheoThang([FromQuery] int thang, int nam)
        {
            double? tongtien = 0;

            var hoadonlist = await (from h in lavenderContext.Hoadon
                                    select h).ToListAsync();

            if (hoadonlist == null || hoadonlist.Count == 0) return StatusCode(200, Json(new { tongtien = 0 }));

            tongtien += (from x in hoadonlist
                         where x.Ngayhoadon.Month == thang && x.Ngayhoadon.Year == nam
                         select x.Tongtien).Sum();
            return StatusCode(200, Json(tongtien));

        }

        [Authorize(Roles = "ADMINISTRATOR, STAFF")]
        [Route("/them-sua-hoa-don")]
        [HttpPost]
        public async Task<IActionResult> AddOrUpdateHoadon(JsonElement json)
        {


            int? sohoadon = int.Parse(json.GetString("sohoadon"));
            var makhachhang = int.Parse(json.GetString("makhachhang"));

            int? makhuyenmai = null;
            if (!string.IsNullOrEmpty(json.GetString("makhuyenmai"))) int.Parse(json.GetString("makhuyenmai"));

            var ngayhoadon = DateTime.Parse(json.GetString("ngayhoadon")).ToLocalTime();

            int? manhanvien = null;

            if (!string.IsNullOrEmpty(json.GetString("manhanvien"))) manhanvien = int.Parse(json.GetString("manhanvien"));
            var tongtien = int.Parse(json.GetString("tongtien"));
            Chitiethoadon[] chitiethoadons = Newtonsoft.Json.JsonConvert.DeserializeObject<Chitiethoadon[]>(json.GetString("chitiethoadon"));


            if (!string.IsNullOrEmpty(json.GetString("sohoadon")))
            {
                var hoadon = await lavenderContext.Hoadon.SingleOrDefaultAsync(b => b.Sohoadon == sohoadon);
                hoadon.Makhachhang = makhachhang;
                hoadon.Makhuyenmai = makhuyenmai;
                hoadon.Ngayhoadon = ngayhoadon;
                hoadon.Manhanvien = manhanvien;
                hoadon.Tongtien = tongtien;

                var vanchuyen = await (from x in lavenderContext.Vanchuyen
                                       where x.Sohoadon == hoadon.Sohoadon
                                       select x).FirstOrDefaultAsync();
                if (vanchuyen != null)
                {
                    vanchuyen.Trangthai = json.GetString("trangthai");
                }
                await lavenderContext.SaveChangesAsync();

            }
            else
            {
                Hoadon temp = new Hoadon();
                temp.Makhachhang = makhachhang;
                temp.Makhuyenmai = makhuyenmai;
                temp.Ngayhoadon = ngayhoadon;
                temp.Manhanvien = manhanvien;
                temp.Tongtien = tongtien;

                await lavenderContext.AddAsync(temp);
                await lavenderContext.SaveChangesAsync();
                sohoadon = await (from x in lavenderContext.Hoadon
                                  orderby x.Ngayhoadon descending
                                  select x.Sohoadon).FirstOrDefaultAsync();

            }


            foreach (var i in chitiethoadons)
            {
                var chitiet = await (from c in lavenderContext.Chitiethoadon
                                     where c.Sohoadon == sohoadon
                                     && c.Imei == i.Imei
                                     select c).FirstOrDefaultAsync();
                if (chitiet != null)
                {
                    chitiet.Tien = i.Tien;
                }
                else
                {
                    i.Sohoadon = (int)sohoadon;
                    await lavenderContext.AddAsync(i);
                }
                await lavenderContext.SaveChangesAsync();
            }
            return StatusCode(200);

        }


        [Route("/xoa-hoadon")]
        [Authorize]
        [HttpDelete]
        public async Task<IActionResult> DeleteBill(int sohoadon)
        {
            var chitiethoadons = await (from c in lavenderContext.Chitiethoadon
                                        where c.Sohoadon == sohoadon
                                        select c).ToListAsync();
            foreach (var i in chitiethoadons)
            {
                var chitietsanpham = await (from x in lavenderContext.Chitietsanpham
                                            where x.Imei == i.Imei
                                            select x).FirstOrDefaultAsync();
                chitietsanpham.Tinhtrang = "Sẵn có";
                lavenderContext.Remove(i);
            }
            await lavenderContext.SaveChangesAsync();



            var vanchuyens = await (from v in lavenderContext.Vanchuyen
                                    where v.Sohoadon == sohoadon
                                    select v).ToListAsync();
            foreach (var i in vanchuyens)
            {
                var chitietvanchuyenlist = await (from x in lavenderContext.Chitietvanchuyen
                                                  where x.Mavanchuyen == i.Mavanchuyen
                                                  select x).ToListAsync();
                lavenderContext.RemoveRange(chitietvanchuyenlist);
                lavenderContext.Remove(i);
            }


            await lavenderContext.SaveChangesAsync();
            Hoadon hoadon = await lavenderContext.Hoadon.SingleOrDefaultAsync(x => x.Sohoadon == sohoadon);
            if (hoadon != null)
            {
                lavenderContext.Remove(hoadon);
                await lavenderContext.SaveChangesAsync();
            }


            return StatusCode(200);
        }

        [Route("/tracuu-ngaymua-theosohoadon")]
        [HttpGet]
        public async Task<IActionResult> tracuuNgaymua(int sohoadon)
        {
            var ngaymua = await (from x in lavenderContext.Hoadon
                                 where x.Sohoadon == sohoadon
                                 select x.Ngayhoadon).FirstOrDefaultAsync();
            return StatusCode(200, Json(ngaymua));
        }


        [Route("/hoadon-cuatoi-dangxuly")]
        [Authorize]
        [HttpGet]
        public async Task<IActionResult> HoadonCuatoiDangxuly(int makhachhang)
        {
            var listhoadon = await (from x in lavenderContext.Hoadon
                                    join y in lavenderContext.Vanchuyen
                                    on x.Sohoadon equals y.Sohoadon
                                    orderby x.Sohoadon descending
                                    where x.Makhachhang == makhachhang
                                      && y.Trangthai.Equals("Đang xử lý")

                                    select x).ToListAsync();
            return StatusCode(200, Json(listhoadon));
        }

        [Route("/hoadon-cuatoi-dagiao")]
        [HttpGet]
        public async Task<IActionResult> HoadonDagiao(int makhachhang)
        {
            var listsohoadon = await (from k in lavenderContext.Hoadon
                                      where k.Makhachhang == makhachhang
                                      orderby k.Sohoadon descending
                                      select k.Sohoadon).ToListAsync();
            var listhoadon = new List<Hoadon>();
            foreach (var i in listsohoadon)
            {
                var hoadontemp = await (from h in lavenderContext.Hoadon
                                        join v in lavenderContext.Vanchuyen
                                        on h.Sohoadon equals v.Sohoadon
                                        orderby h.Sohoadon descending
                                        where h.Sohoadon == i
                                        && v.Trangthai.Equals("Đã giao")
                                        select h).FirstOrDefaultAsync();
                if (hoadontemp != null) listhoadon.Add(hoadontemp);
            }

            listhoadon.Distinct().ToList();
            return StatusCode(200, Json(listhoadon));
        }

        [Route("/hoadon-cuatoi-danggiao")]
        [Authorize]
        [HttpGet]
        public async Task<IActionResult> HoadonCuatoiDanggiao(int makhachhang)
        {
            var listhoadon = await (from x in lavenderContext.Hoadon
                                    join y in lavenderContext.Vanchuyen
                                    on x.Sohoadon equals y.Sohoadon
                                    orderby x.Sohoadon descending
                                    where x.Makhachhang == makhachhang
                                     && y.Trangthai.Equals("Đang giao")

                                    select x).ToListAsync();
            return StatusCode(200, Json(listhoadon));
        }

        [Authorize(Roles = "ADMINISTRATOR, STAFF")]
        [Route("/tuchoi-donhang")]
        [HttpGet]
        public async Task<IActionResult> TuchoiDonhang(int sohoadon)
        {
            var vanchuyen = await (from x in lavenderContext.Vanchuyen
                                   where x.Sohoadon == sohoadon
                                   select x).FirstOrDefaultAsync();
            if (vanchuyen == null) return StatusCode(404);
            var chitiethoadon = await (from x in lavenderContext.Chitiethoadon
                                       where x.Sohoadon == sohoadon
                                       select x).ToListAsync();
            foreach (var i in chitiethoadon)
            {
                var ctsp = await (from x in lavenderContext.Chitietsanpham
                                  where x.Imei == i.Imei
                                  select x).FirstOrDefaultAsync();
                ctsp.Tinhtrang = "Sẵn có";
            }
            vanchuyen.Trangthai = "Đã hủy";
            await lavenderContext.SaveChangesAsync();
            return StatusCode(200);
        }

        [Authorize(Roles = "ADMINISTRATOR, STAFF")]
        [Route("/tiepnhan-donhang")]
        [HttpGet]
        public async Task<IActionResult> TiepnhanDonhang(int sohoadon, int manhanvien)
        {
            var hoadon = await (from x in lavenderContext.Hoadon
                                where x.Sohoadon == sohoadon
                                select x).FirstOrDefaultAsync();
            if (hoadon == null) return StatusCode(404);
            hoadon.Manhanvien = manhanvien;

            var vanchuyen = await (from x in lavenderContext.Vanchuyen
                                   where x.Sohoadon == sohoadon
                                   select x).FirstOrDefaultAsync();
            if (vanchuyen == null) return StatusCode(404);
            vanchuyen.Trangthai = "Đang giao";

            var chitietvanchuyen = new Chitietvanchuyen();
            chitietvanchuyen.Mavanchuyen = vanchuyen.Mavanchuyen;
            chitietvanchuyen.Thoidiem = DateTime.Now.ToLocalTime();
            chitietvanchuyen.Trangthai = "Đã xuất kho";
            await lavenderContext.AddAsync(chitietvanchuyen);
            await lavenderContext.SaveChangesAsync();
            return StatusCode(200);
        }


        [Route("/hoadon-cuatoi-dahuy")]
        [Authorize]
        [HttpGet]
        public async Task<IActionResult> HoadonCuatoiDahuy(int makhachhang)
        {
            var listhoadon = await (from x in lavenderContext.Hoadon
                                    join y in lavenderContext.Vanchuyen
                                    on x.Sohoadon equals y.Sohoadon
                                    orderby x.Sohoadon descending
                                    where y.Trangthai.Equals("Đã hủy")
                                    && x.Makhachhang == makhachhang
                                    select x).ToListAsync();
            return StatusCode(200, Json(listhoadon));
        }
    }

}
