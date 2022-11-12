using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Back.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
namespace Back.Controllers
{
    // [EnableCors(origins: "*", headers: "accept,content-type,origin,x-my-header", methods: "*")]

    [ApiController]

    public class MobileController : Controller
    {
        private readonly ILogger<MobileController> _logger;
        private readonly IWebHostEnvironment _env;

        private readonly lavenderContext lavenderContext;

        public MobileController(ILogger<MobileController> logger, IWebHostEnvironment env, lavenderContext lavenderContext)
        {
            _logger = logger;
            _env = env;
            this.lavenderContext = lavenderContext;
        }

        [Route("/mobile")]
        public async Task<IActionResult> GetAllMobile()
        {
            var sanphams = await (from x in lavenderContext.Sanpham
                                  join y in lavenderContext.Thuonghieu
                                  on x.Mathuonghieu equals y.Mathuonghieu
                                  where x.Maloai == 1
                                  orderby x.Masanpham ascending
                                  select new
                                  {
                                      masanpham = x.Masanpham,
                                      tensanpham = x.Tensanpham,
                                      tenthuonghieu = y.Tenthuonghieu,
                                      maloai = x.Maloai,
                                      mathuonghieu = x.Mathuonghieu,
                                      mota = x.Mota,
                                      image = x.Image,
                                      thoidiemramat = x.Thoidiemramat,
                                      dongia = x.Dongia,
                                      thoigianbaohanh = x.Thoigianbaohanh
                                  }).ToListAsync();
            return StatusCode(200, Json(sanphams));
        }

        [Route("/mobile-with-new-price")]
        [HttpGet]
        public async Task<IActionResult> MobileWithNewPrice()
        {
            var sanphams = await (from x in lavenderContext.Sanpham
                                  orderby x.Masanpham ascending
                                  where x.Maloai == 1
                                  select x).ToListAsync();

            List<Task> tasks = new List<Task>();
            List<dynamic> listnew = new List<dynamic>();
            foreach (var i in sanphams)
            {
                lavenderContext context = new lavenderContext();
                Task task = Task.Run(async () =>
                {
                    float giamoi = 0;
                    giamoi = await (from c in context.Chitietsanpham
                                    where c.Masanpham == i.Masanpham
                                    && c.Tinhtrang.Equals("Sẵn có")
                                    orderby c.Giamoi ascending
                                    select c.Giamoi).FirstOrDefaultAsync();
                    var thuonghieutemp = await (from x in context.Thuonghieu
                                                where x.Mathuonghieu == i.Mathuonghieu
                                                select x).FirstOrDefaultAsync();
                    listnew.Add(new
                    {
                        masanpham = i.Masanpham,
                        tensanpham = i.Tensanpham,
                        tenthuonghieu = thuonghieutemp.Tenthuonghieu,
                        maloai = i.Maloai,
                        mathuonghieu = i.Mathuonghieu,
                        mota = i.Mota,
                        image = i.Image,
                        thoidiemramat = i.Thoidiemramat,
                        dongia = i.Dongia,
                        thoigianbaohanh = i.Thoigianbaohanh,
                        giamoi = giamoi
                    });
                });
                tasks.Add(task);
            }
            await Task.WhenAll(tasks);
            return StatusCode(200, Json(listnew));
        }
    }
}


