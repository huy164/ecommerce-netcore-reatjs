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
using Microsoft.AspNetCore.Authorization;
using Back.Common;
using Back.Services;
using Microsoft.Extensions.Configuration;



namespace Back.Controllers
{
    // [EnableCors(origins: "*", headers: "accept,content-type,origin,x-my-header", methods: "*")]

    [ApiController]
    public class ChitiethoadonController : Controller
    {
        private readonly ILogger<ChitiethoadonController> _logger;
        private readonly IEmailSender sendMailService;
        private readonly IConfiguration _configuration;


        lavenderContext lavenderContext;
        public ChitiethoadonController(ILogger<ChitiethoadonController> logger, lavenderContext lavenderContext, IConfiguration configuration, IEmailSender sendMailService)
        {
            _logger = logger;
            this.lavenderContext = lavenderContext;
            this.sendMailService = sendMailService;
            this._configuration = configuration;
        }

        // [Route("/chitietthoadon-theo-sohoadon")]
        // // [Authorize(Roles = "ADMINISTRATOR, STAFF")]
        // [HttpGet]
        // public async Task<IActionResult> detailByBillId(int sohoadon)
        // {

        //     var chitiethoadons = await (from c in lavenderContext.Chitiethoadon
        //                                 where c.Sohoadon == sohoadon
        //                                 select c).ToListAsync();
        //     return StatusCode(200, Json(chitiethoadons));
        // }


        [Route("/chitietthoadon-theo-sohoadon")]
        // [Authorize(Roles = "ADMINISTRATOR, STAFF")]
        [HttpGet]
        public async Task<IActionResult> detailByBillId(int sohoadon)
        {

            var chitiethoadons = await (from cthd in lavenderContext.Chitiethoadon
                                        join ctsp in lavenderContext.Chitietsanpham on cthd.Imei equals ctsp.Imei
                                        join sp in lavenderContext.Sanpham on ctsp.Masanpham equals sp.Masanpham
                                        where cthd.Sohoadon == sohoadon
                                        select new { 
                                            sohoadon= cthd.Sohoadon,
                                            masanpham=sp.Masanpham,
                                            tensanpham= sp.Tensanpham,
                                            imei= ctsp.Imei,
                                            mausac=ctsp.Mausac,
                                            dungluong= ctsp.Dungluong,
                                            giamoi=ctsp.Giamoi,
                                            tien=cthd.Tien,
                                            dadanhgia=cthd.Dadanhgia,
                                            image = ctsp.Image,
                                        }).ToListAsync();
            return StatusCode(200, Json(chitiethoadons));
        }

        [Route("/chitietthoadon-guiMail")]
        // [Authorize(Roles = "ADMINISTRATOR, STAFF")]
        [HttpGet]
        public async Task<IActionResult> guiMail(int sohoadon)
        {
            var chitiethoadons = await (from cthd in lavenderContext.Chitiethoadon
                                        join ctsp in lavenderContext.Chitietsanpham on cthd.Imei equals ctsp.Imei
                                        join sp in lavenderContext.Sanpham on ctsp.Masanpham equals sp.Masanpham
                                        where cthd.Sohoadon == sohoadon
                                        select new
                                        {
                                            tensanpham = sp.Tensanpham,
                                            dungluong = ctsp.Dungluong,
                                            mausac = ctsp.Mausac,
                                            imei = ctsp.Imei,
                                            giamoi = ctsp.Giamoi
                                        }).ToListAsync();


            var hoadon = await (from hd in lavenderContext.Hoadon
                                join kh in lavenderContext.Khachhang on hd.Makhachhang equals kh.Makhachhang
                                where hd.Sohoadon == sohoadon
                                select new
                                {
                                    tenkhachhang = kh.Tenkhachhang,
                                    sodienthoai = kh.Sodienthoai,
                                    diachi = kh.Diachi,
                                    sohoadon = hd.Sohoadon,
                                    ngayhoadon = hd.Ngayhoadon,
                                    phivanchuyen = hd.Phivanchuyen,
                                    tongtien = hd.Tongtien
                                }).FirstOrDefaultAsync();


            var email = await (from kh in lavenderContext.Khachhang
                               join hd in lavenderContext.Hoadon on kh.Makhachhang equals hd.Makhachhang
                               join cthd in lavenderContext.Chitiethoadon on hd.Sohoadon equals cthd.Sohoadon
                               select kh.Email
                               ).FirstOrDefaultAsync();
            string htmlemail = "";

            htmlemail += "<h3>S??? H??a ????n : " + hoadon.sohoadon + "</h3>" +
    "<h3>Ng??y mua :" + hoadon.ngayhoadon + "</h3>" +
    "<h3>????n v??? b??n h??ng : C??ng ty Lavender</h3>" +
    "<h3>?????a ch??? : Tr?????ng ??H CNTT HCM</h3>" +
    "<h3>?????i di???n ph??p l?? : V?? Quang Huy</h3>" +
    "<h3>M?? s??? thu??? : 110047893292</h3>" +
    "<h3>S??? ??i???n tho???i: 028-3228-38733</h3>" +
    "<h3>Email: vqh.official@gmail.com </h3>" +
    "<hr>";

            htmlemail += "<h3>T??n kh??ch h??ng : " + hoadon.tenkhachhang + "</h3>" +
            "<h3>?????a ch??? : " + hoadon.diachi + " </h3>" +
            "<h3>S??? ??i???n tho???i : " + hoadon.sodienthoai + " </h3>";



            //==================chi tiet hoa don=====================================
            htmlemail += "<h3>Chi ti???t ????n h??ng </h3>";
            htmlemail += "    <table style='background-color: #f4f1ff;font-size: 20px; width:1000px;text-align: left;border: 1px solid black;'>";
            htmlemail += "   <tr style='border: 1px solid black;'>";
            htmlemail += "  <th style='border: 1px solid black;' >STT</th>  ";
            htmlemail += "  <th style='border: 1px solid black;' >T??n s???n ph???m</th>  ";
            htmlemail += "  <th style='border: 1px solid black;'>Dung l?????ng</th>  ";
            htmlemail += "  <th style='border: 1px solid black;'>M??u s???c</th>  ";
            htmlemail += "   <th style='border: 1px solid black;'>Imei</th> ";
            htmlemail += "  <th style='border: 1px solid black;'>Gi??</th>  ";
            htmlemail += "   </tr> ";

            double tongtienhang = 0;
            for (int i = 0; i < chitiethoadons.Count(); i++)
            {
                int stt = i + 1;
                htmlemail += "   <tr style='border: 1px solid black;'>";
                htmlemail += "  <td style='border: 1px solid black;'> " + stt + "</td>";
                htmlemail += "  <td style='border: 1px solid black;'> " + chitiethoadons[i].tensanpham + "</td>";
                htmlemail += "  <td style='border: 1px solid black;'>" + chitiethoadons[i].dungluong + "</td>";
                htmlemail += "  <td style='border: 1px solid black;'>" + chitiethoadons[i].mausac + "</td>";
                htmlemail += "   <td style='border: 1px solid black;'>" + chitiethoadons[i].imei + "</td>";
                htmlemail += "  <td style='border: 1px solid black;'>" + chitiethoadons[i].giamoi + "</td>";
                htmlemail += "   </tr> ";
                tongtienhang += chitiethoadons[i].giamoi;
            }
            htmlemail += "  </table> ";
            htmlemail += "<h3>C???ng ti???n h??ng : " + tongtienhang + "??</h3>";
            htmlemail += "<h3>Gi???m gi?? : " + Math.Round(tongtienhang - Convert.ToDouble(hoadon.tongtien) + Convert.ToDouble(hoadon.phivanchuyen)) + "??</h3>";
            htmlemail += "<h3>Ph?? v???n chuy???n: " + hoadon.phivanchuyen + "??</h3>";
            htmlemail += "<h3>Th??nh ti???n: " + hoadon.tongtien + "??</h3>";

            await sendMailService.SendEmailAsync(email, "Lavender g???i h??a ????n", htmlemail);
            return StatusCode(200);
        }

        [Route("/tracuu-sohoadon")]
        [HttpGet]
        public async Task<IActionResult> detailBillByImei(string imei)
        {

            var sohoadon = await (from c in lavenderContext.Chitiethoadon
                                  where c.Imei == imei
                                  select c.Sohoadon).FirstOrDefaultAsync();
            return StatusCode(200, Json(sohoadon));
        }

        [Route("/sanpham-ban-trongthang")]
        [HttpGet]
        [Authorize(Roles = "ADMINISTRATOR, STAFF")]
        public async Task<IActionResult> SanphamBanTrongthang(int thang, int nam)
        {
            var sosanpham = 0;
            var sanphams = await (from x in lavenderContext.Chitiethoadon
                                  join y in lavenderContext.Hoadon
                                  on x.Sohoadon equals y.Sohoadon
                                  select new { imei = x.Imei, ngayhoadon = y.Ngayhoadon }).ToListAsync();
            sosanpham += (from x in sanphams
                          where x.ngayhoadon.Year == nam && x.ngayhoadon.Month == thang
                          select x).Count();
            return StatusCode(200, Json(sosanpham));
        }

    }
}
