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

using Back.Models.ModelDTO;
using Back.ModelDTO;
/*using Back.Models; */



namespace Back.Controllers
{
    public class BaiVietController : Controller
    {
        private readonly ILogger<BaiVietController> _logger;
        lavenderContext lavenderContext;
        public BaiVietController(ILogger<BaiVietController> logger, lavenderContext lavenderContext)
        {
            _logger = logger;
            this.lavenderContext = lavenderContext;
        }

        [Route("/all-baiviet")]
        [HttpGet]
        public async Task<IActionResult> GetAllBaiViet()
        {
            var baivietlist = await (from bv in lavenderContext.Baiviets
                                     where bv.xacnhan == 1
                                     orderby bv.mabaiviet descending
                                     select bv).ToListAsync();
            return StatusCode(200, JsonConvert.SerializeObject(baivietlist));
        }


        [Route("/all-baivietpending")]
        [HttpGet]
        public async Task<IActionResult> GetAllBaiVietpending()
        {
            var baivietlist = await (from bv in lavenderContext.Baiviets
                                     where bv.xacnhan == 0
                                     select bv).ToListAsync();
            return StatusCode(200, JsonConvert.SerializeObject(baivietlist));
        }


        [Route("/chitiet-baiviet/{mabaiviet}")]
        [HttpGet]
        public async Task<IActionResult> GetBaiViet(int mabaiviet)
        {
            var baivietlist = await (from bv in lavenderContext.Baiviets where bv.xacnhan == 1 && bv.mabaiviet == mabaiviet select bv).ToListAsync();
            return StatusCode(200, JsonConvert.SerializeObject(baivietlist));
        }


        [Route("/xacnhan-baiviet/{mabaiviet}")]
        [HttpGet]
        public async Task<IActionResult> xacnhanBaiviet(int mabaiviet)
        { 
            Baiviet bv_item = await (from bv in lavenderContext.Baiviets
                                 where bv.mabaiviet == mabaiviet
                                 select bv).FirstAsync();
            bv_item.xacnhan = 1;
            await lavenderContext.SaveChangesAsync();
            return StatusCode(200,mabaiviet);
        }

        [Route("/xoa-baiviet/{mabaiviet}")]
        [HttpGet]
        public async Task<IActionResult> tuchoiBaiviet(int mabaiviet)
        {
            var bv_item = await lavenderContext.Baiviets.SingleAsync(x => x.mabaiviet == mabaiviet);
            lavenderContext.Remove(bv_item);
            await lavenderContext.SaveChangesAsync();
            return StatusCode(200,bv_item);
        }



        [Route("/them-baiviet")]
        [HttpPost]
        public async Task<IActionResult> AddArticle([FromForm] BaivietAdd baivietsubmit)
        {
           // Console.WriteLine("Baiviet" + baivietsubmit);
            Baiviet Baiviet = new Baiviet();
            Baiviet.tieude = baivietsubmit.tieude;
            Baiviet.mota = baivietsubmit.mota;
            Baiviet.noidung = baivietsubmit.noidung;
            Baiviet.thumnail = baivietsubmit.thumnail;
            Baiviet.xacnhan = 0;
            await lavenderContext.AddAsync(Baiviet);
            await lavenderContext.SaveChangesAsync();
            return StatusCode(200, JsonConvert.SerializeObject(Baiviet));
        }
    }
}
