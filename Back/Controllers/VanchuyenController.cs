
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;

using System.Threading.Tasks;

using Back.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace Back.Controllers
{

    // [EnableCors(origins: "*", headers: "accept,content-type,origin,x-my-header", methods: "*")]
    [ApiController]

    public class VanchuyenController : Controller
    {
        private readonly ILogger<VanchuyenController> _logger;
        private readonly IWebHostEnvironment _env;

        private readonly lavenderContext lavenderContext;

        public VanchuyenController(ILogger<VanchuyenController> logger, IWebHostEnvironment env, lavenderContext lavenderContext)
        {
            _logger = logger;
            _env = env;
            this.lavenderContext = lavenderContext;
        }

        [Route("/vanchuyen-bang-sohoadon")]
        [HttpGet]
        public async Task<IActionResult> VanchuyenBangSohoadon(int sohoadon)
        {
            var vanchuyen = await (from x in lavenderContext.Vanchuyen
                                   where x.Sohoadon == sohoadon
                                   select x).FirstOrDefaultAsync();
            if (vanchuyen == null) return StatusCode(404);
            return StatusCode(200, Json(vanchuyen));
        }

        [Route("/tinh-phivanchuyen")]
        [HttpGet]
        public async Task<IActionResult> TinhPhiVanChuyen(int khoangcach)
        {
            int phivanchuyen = await (from pvc in lavenderContext.Phivanchuyen
                                      where pvc.khoangcachmin < khoangcach &&
                                       pvc.khoangcachmax >= khoangcach
                                      select pvc.chiphi).FirstOrDefaultAsync();

            return StatusCode(200, phivanchuyen);
        }

        [Route("/tatca-phivanchuyen")]
        [HttpGet]
        public async Task<IActionResult> AllKhachhang()
        {
            var phivanchuyens = await (from p in lavenderContext.Phivanchuyen
                                       orderby p.chiphi ascending
                                       select p).ToListAsync();
            if (phivanchuyens == null || phivanchuyens.Count() == 0) return StatusCode(404);
            return StatusCode(200, Json(phivanchuyens));
        }

        [Route("/them-phivanchuyen")]
        [HttpGet]
        public async Task<IActionResult> AddDeliveryCost(int khoangcachmin, int khoangcachmax, int chiphi)
        {
            Phivanchuyen Phivanchuyen = new Phivanchuyen();
            Phivanchuyen.khoangcachmin = khoangcachmin;
            Phivanchuyen.khoangcachmax = khoangcachmax;
            Phivanchuyen.chiphi = chiphi;
            await lavenderContext.AddAsync(Phivanchuyen);
            await lavenderContext.SaveChangesAsync();
            return StatusCode(200, Phivanchuyen);
        }

        [Route("/sua-phivanchuyen")]
        [HttpGet]
        public async Task<IActionResult> EditDeliveryCost(int maphivanchuyen, int khoangcachmin, int khoangcachmax, int chiphi)
        {
            Phivanchuyen pvc = await (from p in lavenderContext.Phivanchuyen
                                      where p.maphivanchuyen == maphivanchuyen
                                      select p).FirstAsync();
            pvc.khoangcachmin = khoangcachmin;
            pvc.khoangcachmax = khoangcachmax;
            pvc.chiphi = chiphi;
            await lavenderContext.SaveChangesAsync();
            return StatusCode(200, pvc);
        }

        [Route("/xoa-phivanchuyen")]
        [HttpGet]
        public async Task<IActionResult> DeleteDeliveryCost(int maphivanchuyen)
        {
            Phivanchuyen pvc = await (from p in lavenderContext.Phivanchuyen
                                      where p.maphivanchuyen == maphivanchuyen
                                      select p).FirstAsync();
            lavenderContext.Remove(pvc);
            await lavenderContext.SaveChangesAsync();
            return StatusCode(200, pvc);
        }
    }
}
