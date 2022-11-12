
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text.Json;
using System.Threading.Tasks;

using Back.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;

namespace Back.Controllers
{

    // [EnableCors(origins: "*", headers: "accept,content-type,origin,x-my-header", methods: "*")]
    [ApiController]

    public class TruycapController : Controller
    {
        private readonly ILogger<TruycapController> _logger;
        private readonly IWebHostEnvironment _env;

        private readonly lavenderContext lavenderContext1;

        private readonly lavenderContext lavenderContext2;

        public TruycapController(ILogger<TruycapController> logger, IWebHostEnvironment env, lavenderContext lavenderContext1, lavenderContext lavenderContext2)
        {
            _logger = logger;
            _env = env;
            this.lavenderContext1 = lavenderContext1;
            this.lavenderContext2 = lavenderContext2;
        }

        [Route("/truycap-andanh")]
        [HttpPost]
        public async Task<IActionResult> AccessAnonymous(JsonElement json)
        {
            var truycapandanh = new Truycapandanh();
            truycapandanh.Ip = json.GetString("ip");
            truycapandanh.Thoidiem = DateTime.Now.ToLocalTime();
            await lavenderContext1.AddAsync(truycapandanh);
            await lavenderContext1.SaveChangesAsync();
            return StatusCode(200);
        }

        [Route("/luotxem-trongthang")]
        [Authorize(Roles = "ADMINISTRATOR, STAFF")]
        [HttpGet]
        public async Task<IActionResult> LuotxemTrongthang(int thang, int nam)
        {
            int luotxem = 0;

                Task taskTaikhoan = Task.Run(async () =>
                {
                    var dangnhaps = await (from x in lavenderContext1.Khachhangdangnhap
                                           select x).ToListAsync();
                    luotxem += (from x in dangnhaps
                                where x.Thoidiem.Month == thang && x.Thoidiem.Year == nam
                                select x).Count();
                });

                Task taskAndanh = Task.Run(async () =>
                {
                    var andanhs = await lavenderContext2.Truycapandanh.ToListAsync();
                    luotxem += (from x in andanhs
                                where x.Thoidiem.Month == thang && x.Thoidiem.Year == nam
                                select x).Count();
                });

                List<Task> tasks = new List<Task>();
                tasks.Add(taskTaikhoan);
                tasks.Add(taskAndanh);
                await Task.WhenAll(tasks);
  

            return StatusCode(200, Json(luotxem));
        }
    }
}
