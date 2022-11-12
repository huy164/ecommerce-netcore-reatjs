using System;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using Back.Common;
using Back.Models;
using Back.Models.ModelDTO;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace Back.Controllers
{
    // [EnableCors(origins: "*", headers: "accept,content-type,origin,x-my-header", methods: "*")]
    [ApiController]

    public class ProductController : Controller
    {
        private readonly ILogger<ProductController> _logger;
        private readonly IWebHostEnvironment _env;

        private readonly lavenderContext lavenderContext;

        public ProductController(ILogger<ProductController> logger, IWebHostEnvironment env, lavenderContext lavenderContext)
        {
            _logger = logger;
            _env = env;
            this.lavenderContext = lavenderContext;
        }

        [Route("/{loai}/{hang}/{dong}/{sanpham}")]
        public async Task<IActionResult> ProductInfo(string loai, string hang, string dong, string sanpham, string dungluong, string mausac)
        {
            int maloai = 0;
            switch (loai)
            {
                case "mobile":
                    maloai = 1;
                    break;
                case "laptop":
                    maloai = 2;
                    break;
                default:
                    break;
            }
            int? productid = null;
            int trademarkid = await lavenderContext.Thuonghieu.Where(s => s.Tenthuonghieu.Contains(hang)).Select(s => s.Mathuonghieu).FirstOrDefaultAsync();
            productid = await (from x in lavenderContext.Sanpham
                                   where x.Mathuonghieu== trademarkid
                                   &&(x.Tensanpham.ToLower().Contains(dong.ToLower()) || dong.ToLower().Equals("sub"))
                                   && x.Tensanpham.ToLower().Contains(sanpham.ToLower())
                                   select x.Masanpham).FirstOrDefaultAsync();

          
            var product = await (from p in lavenderContext.Sanpham
                                 where
                                 p.Maloai == maloai &&
                                 p.Mathuonghieu == trademarkid &&
                                 p.Masanpham == productid
                                 select p).FirstOrDefaultAsync();
            int fCount = 0;
            if (product != null)
            {
                string dirFullPath = ($"{_env.ContentRootPath}/wwwroot/{loai}/{hang}/{dong}/{sanpham}");
                string[] files;
  
                files = System.IO.Directory.GetFiles(dirFullPath);
                foreach(var i in files)
                {
                    if (i.ToLower().Contains("jpeg")|| i.ToLower().Contains("jpg")|| i.ToLower().Contains("png"))
                    {
                        fCount++;
                    }
                }
                return StatusCode(200, Json(product, new { sohinhanh = fCount }));
            }
            return StatusCode(404);

        }

        [Route("/tim-cacsanpham-theo-sohoadon")]
        [HttpGet]
        public async Task<IActionResult> TimCacsanphamTheoSohoadon(int sohoadon)
        {
            var listimei = await (from c in lavenderContext.Chitiethoadon
                                  where c.Sohoadon == sohoadon
                                  select c.Imei).ToListAsync();
            var listproductid = new List<int>();
            List<Task> tasks1 = new List<Task>();
            foreach (var i in listimei)
            {
                lavenderContext context = new lavenderContext();
                Task task = Task.Run(async () =>
                {
                    int? id = await (from x in context.Chitietsanpham
                                    where x.Imei == i
                                    select x.Masanpham).FirstOrDefaultAsync();
                    if (id != null)
                    {
                        listproductid.Add((int)id);
                    }
                });
                tasks1.Add(task);
            }
            await Task.WhenAll(tasks1);

            var listproduct = new List<dynamic>();
            List<Task> tasks2 = new List<Task>();
            foreach (var i in listproductid)
            {
                lavenderContext context = new lavenderContext();
                Task task = Task.Run(async () =>
                {
                    var temp = await (from s in context.Sanpham
                                      join k in context.Thuonghieu
                                      on s.Mathuonghieu equals k.Mathuonghieu
                                      where s.Masanpham == i
                                      select new
                                      {
                                          masanpham = s.Masanpham,
                                          tensanpham = s.Tensanpham,
                                          tenthuonghieu = k.Tenthuonghieu,
                                          maloai = s.Maloai,
                                          mathuonghieu = s.Mathuonghieu,
                                          mota = s.Mota,
                                          image = s.Image,
                                          thoidiemramat = s.Thoidiemramat,
                                          dongia = s.Dongia,
                                          thoigianbaohanh = s.Thoigianbaohanh,
                                      }).ToListAsync();
                    if (temp != null && temp.Count() != 0)
                    {
                        foreach( var t in temp)
                        {
                            if (t != null)
                            {
                                listproduct.Add(t);
                            }
                        }
                    }

                });
                tasks2.Add(task);
            }
            await Task.WhenAll(tasks2);
            return StatusCode(200, Json(listproduct));
        }

        [Route("/tim-sanpham-theo-masanpham")]
        [HttpGet]
        public async Task<IActionResult> FindProductbyId(int masanpham)
        {
            var sanpham = await lavenderContext.Sanpham.SingleOrDefaultAsync(x => x.Masanpham == masanpham);
            if (sanpham == null) return StatusCode(404);
            return StatusCode(200, Json(sanpham));
        }

        [Route("/tim-sanpham-theo-tenthuonghieu")]
        [HttpGet]
        public async Task<IActionResult> TimsanphamTheoThuonghieu(string tenthuonghieu)
        {
            var thuonghieu = await lavenderContext.Thuonghieu.SingleOrDefaultAsync(x => x.Tenthuonghieu.ToLower().Equals(tenthuonghieu));
            if (thuonghieu == null) return StatusCode(404);
            var sanphams = await (from s in lavenderContext.Sanpham
                                  where s.Mathuonghieu == thuonghieu.Mathuonghieu
                                  select s).ToListAsync();
            return StatusCode(200, Json(sanphams));
        }

        [Route("/thongsokithuat-bang-masanpham")]
        [HttpGet]
        public async Task<IActionResult> ThongsokithuatBangMasanpham(int masanpham)
        {
            var temp = await (from x in lavenderContext.Thongsokithuat
                              where x.Masanpham == masanpham
                              select x).ToListAsync();
            List<ThongsokithuatForm> thongsokithuatForms = new List<ThongsokithuatForm>();
            foreach (var x in temp)
            {
                var thongso = new ThongsokithuatForm();
                thongso.ten = x.Ten;
                thongso.noidung = x.Noidung;
                thongsokithuatForms.Add(thongso);
            }
            return StatusCode(200, Json(thongsokithuatForms));
        }

        [Route("/them-thongsokithuat")]
        [Authorize(Roles = "ADMINISTRATOR, STAFF")]
        [HttpPost]
        public async Task<IActionResult> AddSpecifications(JsonElement json)
        {
            ThongsokithuatForm[] thongsokithuatForms = Newtonsoft.Json.JsonConvert.DeserializeObject<ThongsokithuatForm[]>(json.GetString("thongsokithuat"));
            int masanpham = int.Parse(json.GetString("masanpham"));
            foreach (var i in thongsokithuatForms)
            {
                if (string.IsNullOrEmpty(i.ten)) continue;
                var temp = await (from x in lavenderContext.Thongsokithuat
                                  where x.Masanpham == masanpham
                                  && x.Ten.Equals(i.ten)
                                  select x).FirstOrDefaultAsync();
                if (temp == null)
                {
                    temp = new Thongsokithuat();
                    temp.Masanpham = masanpham;
                    temp.Ten = i.ten;
                    temp.Noidung = i.noidung;
                    await lavenderContext.AddAsync(temp);
                }
                else
                {
                    temp.Noidung = i.noidung;
                    await lavenderContext.SaveChangesAsync();
                }
            }
            await lavenderContext.SaveChangesAsync();
            return Ok();
        }


        [Route("/them-sanpham")]
        [Authorize(Roles = "ADMINISTRATOR, STAFF")]
        [HttpPost]
        public async Task<IActionResult> AddProduct([FromForm] string tensanpham, [FromForm] int maloai,
            [FromForm] int mathuonghieu, [FromForm] string mota, [FromForm] IFormFile image, [FromForm] string thoidiemramat, [FromForm] float dongia, [FromForm] int thoigianbaohanh
            )
        {
            string loai = "";
            switch (maloai)
            {
                case 1:
                    loai = "mobile";
                    break;
                case 2:
                    loai = "laptop";
                    break;
                default:
                    break;
            }

            string hang = await (from t in lavenderContext.Thuonghieu
                                 where t.Mathuonghieu == mathuonghieu
                                 select t.Tenthuonghieu).FirstOrDefaultAsync();
            if (hang == null) return StatusCode(404);
            string[] tokens = tensanpham.Split(' ');

            int i = 0;
            for (; i < tokens.Length; i++)
            {
                if (!string.IsNullOrWhiteSpace(tokens[i]))
                {
                    break;
                }
                else if (i == tokens.Length - 1)
                {
                    return StatusCode(304);
                }
            }
            string dong = "";
            string sanpham = "";
            string path = "";
            if (tokens.Length - i == 1)
            {
                dong = "sub";
                sanpham = tokens[0];
               
            }
            else if (tokens.Length - i > 1)
            {
                dong = tokens[i];
                int beforelength = 0;
                for (int t = 0; t <= i; t++)
                {
                    beforelength += tokens[t].Length;
                }
                sanpham = tensanpham.Substring(beforelength + 1);
            }
            path = $"/{loai}/{hang}/{sanpham}";

            Sanpham s = new Sanpham();
            s.Tensanpham = tensanpham;
            s.Maloai = maloai;
            s.Mathuonghieu = mathuonghieu;
            s.Mota = mota;
            s.Thoidiemramat = DateTime.Parse(thoidiemramat).ToLocalTime();
            s.Dongia = dongia;
            s.Thoigianbaohanh = thoigianbaohanh;
            s.Image = path;

            await lavenderContext.AddAsync(s);
            await lavenderContext.SaveChangesAsync();

            if (image == null || image.Length == 0) return StatusCode(200, Json(s));

            string NewDir = _env.ContentRootPath + "/wwwroot" + path;

            if (!Directory.Exists(NewDir))
            {
                // Create the directory.
                Directory.CreateDirectory(NewDir);
            }
            using (var memoryStream = new MemoryStream())
            {
                await image.CopyToAsync(memoryStream);
                using (var img = Image.FromStream(memoryStream))
                {
                    // TODO: ResizeImage(img, 100, 100);
                    img.Save(_env.ContentRootPath + "/wwwroot" + path + "/0.Jpeg", ImageFormat.Jpeg);
                }
            }
            return StatusCode(200, Json(s));
        }

        [Route("/sua-sanpham")]
        [Authorize(Roles = "ADMINISTRATOR, STAFF")]
        [HttpPost]
        public async Task<IActionResult> EditProduct([FromForm] int masanpham, [FromForm] string tensanpham, [FromForm] int maloai,
            [FromForm] int mathuonghieu, [FromForm] string mota, [FromForm] IFormFile image, [FromForm] string thoidiemramat, [FromForm] float dongia, [FromForm] int thoigianbaohanh)
        {
            string loai = "";
            switch (maloai)
            {
                case 1:
                    loai = "mobile";
                    break;
                case 2:
                    loai = "laptop";
                    break;
                default:
                    break;
            }

            string hang = await (from t in lavenderContext.Thuonghieu
                                 where t.Mathuonghieu == mathuonghieu
                                 select t.Tenthuonghieu).FirstOrDefaultAsync();
            if (hang == null) return StatusCode(404);
            string[] tokens = tensanpham.Split(' ');

            int i = 0;
            for (;i<tokens.Length; i++)
            {
                if (!string.IsNullOrWhiteSpace(tokens[i])) {
                    break;
                }
                else if (i== tokens.Length-1)
                {
                    return StatusCode(304);
                }
            }
            string dong = "";
            string sanpham = "";
            string path = "";
            if (tokens.Length - i == 1)
            {
                dong = "sub";
                sanpham = tokens[0];
            }
            else if (tokens.Length - i > 1)
            {
                dong = tokens[i];
                int beforelength = 0;
                for (int t = 0; t <= i; t++)
                {
                    beforelength += tokens[t].Length;
                }
                sanpham = tensanpham.Substring(beforelength + 1);
            }
            path = $"/{loai}/{hang}/{dong}/{sanpham}";

            var s = await (from p in lavenderContext.Sanpham
                           where p.Masanpham == masanpham
                           select p).FirstOrDefaultAsync();
            if (s == null) return StatusCode(404);
            string oldpath = s.Image;
            s.Tensanpham = tensanpham;
            s.Maloai = maloai;
            s.Mathuonghieu = mathuonghieu;
            s.Mota = mota;
            s.Thoidiemramat = DateTime.Parse(thoidiemramat).ToLocalTime();
            s.Dongia = dongia;
            s.Thoigianbaohanh = thoigianbaohanh;
            s.Image = path;
            await lavenderContext.SaveChangesAsync();

            string OldDir = _env.ContentRootPath + "/wwwroot" + oldpath;
            string NewDir = _env.ContentRootPath + "/wwwroot" + path;
            if (OldDir != NewDir)
            {
                MyDataHandler.MoveDir(OldDir, NewDir);
            }
            
            if (image != null && image.Length != 0  )
            {
                if (!Directory.Exists(NewDir))
                {
                    // Create the directory.
                    Directory.CreateDirectory(NewDir);
                }
                using (var memoryStream = new MemoryStream())
                {
                    await image.CopyToAsync(memoryStream);
                    using (var img = Image.FromStream(memoryStream))
                    {
                        img.Save(_env.ContentRootPath + "/wwwroot" + path + "/0.Jpeg", ImageFormat.Jpeg);
                    }
                }
            }
            return StatusCode(200, Json(s));
        }

        [Route("/xoa-sanpham")]
        [Authorize(Roles = "ADMINISTRATOR, STAFF")]
        [HttpGet]
        public async Task<IActionResult> DeleteProduct(int masanpham)
        {
            var product = await (from s in lavenderContext.Sanpham
                                 where s.Masanpham == masanpham
                                 select s).FirstOrDefaultAsync();

            var detailProducts = await (from c in lavenderContext.Chitietsanpham
                                        where c.Masanpham == masanpham
                                        select c).ToListAsync();

            lavenderContext.RemoveRange(detailProducts);

            var thongsokithuat = await (from x in lavenderContext.Thongsokithuat
                                        where x.Masanpham == masanpham
                                        select x).ToListAsync();
            lavenderContext.RemoveRange(thongsokithuat);

            foreach (var i in detailProducts)
            {
                string path = _env.ContentRootPath + "/wwwroot" + i.Image + "0.Jpeg";
                if (System.IO.File.Exists(path))
                {
                    System.IO.File.Delete(path);
                }
            }
            await lavenderContext.SaveChangesAsync();

            lavenderContext.Remove(product);
            {
                string path = _env.ContentRootPath + "/wwwroot" + product.Image + "0.Jpeg";
                if (System.IO.File.Exists(path))
                {
                    System.IO.File.Delete(path);
                }
            }
            await lavenderContext.SaveChangesAsync();
            return StatusCode(200, Json(masanpham));
        }

        [Route("/tim-sanpham")]
        [HttpGet]
        public async Task<IActionResult> FindProduct(string timkiem)
        {
            if (String.IsNullOrEmpty(timkiem))
            {
                var sanphamlist = await (from s in lavenderContext.Sanpham
                                         select s).ToListAsync();
                return StatusCode(200, Json(sanphamlist));
            }
            else
            {
                var sanphamlist = await (from s in lavenderContext.Sanpham
                                         where s.Tensanpham.Contains(timkiem)
                                         select s).ToListAsync();
                return StatusCode(200, Json(sanphamlist));
            }

        }

        [Route("/muoi-sanpham-moinhat")]
        [HttpGet]
        public async Task<IActionResult> TenNewProduct()
        {
            var list = await (from x in lavenderContext.Sanpham
                              orderby x.Thoidiemramat descending
                              select x).ToListAsync();
            return StatusCode(200, Json(list));
        }

        [Route("/timkiem-6-sanpham")]
        [HttpGet]
        public async Task<IActionResult> Timkiem6Sanpham(string timkiem)
        {
            var list = await (from s in lavenderContext.Sanpham
                              where s.Tensanpham.Contains(timkiem)
                              select s).Take(6).ToListAsync();
            List<dynamic> listnew = new List<dynamic>();
            //for (int i = 0; i < 6 && i < list.Count(); i++)
            //{
            //    newlist.Add(list[i]);
            //}
            List<Task> tasks = new List<Task>();
            foreach (var i in list)
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
                        image = i.Image,  
                        dongia = i.Dongia,
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