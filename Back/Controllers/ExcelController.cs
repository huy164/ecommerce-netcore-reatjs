using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using System.Web;
using System.Data;
using GemBox.Spreadsheet;
using System.IO;
using OfficeOpenXml;
using Back.Models;
using System.Drawing;
using OfficeOpenXml.Style;
using System.ComponentModel;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;
// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Back.Controllers
{
    public class ExcelController : Controller
    {
        lavenderContext lavenderContext;
        public ExcelController(lavenderContext lavenderContext)
        {
            this.lavenderContext = lavenderContext;
        }
        // GET: /<controller>/
        public IActionResult Index()
        {
            return View();
        }
        [Route("/xuat-hoadon")]
        [Authorize(Roles = "ADMINISTRATOR, STAFF")]
        public async Task<IActionResult> XuatHoadon(string tungay, string denngay)
        {
            ExcelPackage.LicenseContext = OfficeOpenXml.LicenseContext.NonCommercial;
            var data = new DataTable();
            var stream = new MemoryStream();
            using (var package = new ExcelPackage(stream))
            {
                var sheet = package.Workbook.Worksheets.Add($"id");
                sheet.Cells["A1:H99"].Style.Font.Name = "Times New Roman";
                sheet.Cells["A1:C1"].Merge = true;
                sheet.Column(3).Width = 25;
                sheet.Column(1).Width = 5.33;
                sheet.Column(2).Width = 11.67;
                sheet.Column(5).Width = 20;
                sheet.Cells["A1:I1"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                sheet.Cells["A1:A1"].Value = "TRƯỜNG ĐH CÔNG NGHỆ THÔNG TIN";
                sheet.Cells["A1:I1"].Merge = true;

                sheet.Cells["A2:I2"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                sheet.Cells["A2:I2"].Style.Font.Bold = true;
                sheet.Cells["A2:A2"].Value = "LAVENDER UIT WEBSHOP";
                sheet.Cells["A2:I2"].Merge = true;

                sheet.Cells["A4:I4"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                sheet.Cells["A4:I4"].Style.Font.Bold = true;
                sheet.Cells["A4:I4"].Style.Font.Size = 16;
                sheet.Cells["A4:A4"].Value = "THỐNG KÊ DOANH SỐ BÁN SẢN PHẨM";
                sheet.Cells["A4:I4"].Merge = true;

                sheet.Cells["A5:I5"].Merge = true;
                sheet.Cells["A5:I5"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                sheet.Cells["A5:I5"].Style.Font.Bold = true;
                sheet.Cells["A5:A5"].Value = "Từ ngày:";

                sheet.Cells["A6:I6"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                sheet.Cells["A6:I6"].Style.Font.Bold = true;
                sheet.Cells["A6:A6"].Value = "Đến ngày:";
                sheet.Cells["A6:I6"].Merge = true;

                sheet.Row(9).Height = 41.13;
                sheet.Cells["A9:I9"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                sheet.Cells["A9:I9"].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                sheet.Cells["A9:I9"].Style.Fill.PatternType = ExcelFillStyle.Solid;
                sheet.Cells["A9:I9"].Style.Fill.BackgroundColor.SetColor(0, 186, 248, 255);
                sheet.Cells["A9:I9"].Style.Font.Bold = true;
                sheet.Cells["A9:I9"].Style.Border.Left.Style = ExcelBorderStyle.Thin;
                sheet.Cells["A9:I9"].Style.Border.Right.Style = ExcelBorderStyle.Thin;
                sheet.Cells["A9:I9"].Style.Border.Top.Style = ExcelBorderStyle.Thin;
                sheet.Cells["A9:I9"].Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                sheet.Cells["A9:A9"].Value = "STT";
                sheet.Cells["B9:B9"].Value = "Số hoá đơn";
                sheet.Cells["C9:C9"].Value = "Ngày hoá đơn";
                sheet.Cells["D9:D9"].Value = "Mã nhân viên";
                sheet.Cells["E9:E9"].Value = "Tiền";
                sheet.Cells["F9:F9"].Value = "Imei";
                sheet.Cells["G9:G9"].Value = "Mã sản phẩm";
                sheet.Cells["H9:H9"].Value = "Tên sản phẩm";
                sheet.Cells["I9:I9"].Value = "Trạng thái";

                var query = await (from x in lavenderContext.Hoadon
                                   join y in lavenderContext.Chitiethoadon
                                   on x.Sohoadon equals y.Sohoadon
                                   join z in lavenderContext.Chitietsanpham
                                   on y.Imei equals z.Imei
                                   join t in lavenderContext.Sanpham
                                   on z.Masanpham equals t.Masanpham
                                   join k in lavenderContext.Vanchuyen
                                   on x.Sohoadon equals k.Sohoadon
                                   where x.Ngayhoadon <= DateTime.Parse(denngay)
                                   && x.Ngayhoadon >= DateTime.Parse(tungay)
                                   select new
                                   {
                                       sohoadon = x.Sohoadon,
                                       ngayhoadon = x.Ngayhoadon,
                                       manhanvien = x.Manhanvien,
                                       tien = y.Tien,
                                       imei = y.Imei,
                                       masanpham = t.Masanpham,
                                       tensanpham = t.Tensanpham,
                                       trangthai = k.Trangthai
                                   }).ToListAsync();


                var count = query.Count();

                int i = 1;
                int j = 10;
                count = count + 10 - 1;
                string chuoi = $"A10:I{count}";
                var query2 = query.ToList();

                {
                    if (count >= 10)
                    {
                        sheet.Cells[chuoi].Style.Border.Left.Style = ExcelBorderStyle.Thin;
                        sheet.Cells[chuoi].Style.Border.Right.Style = ExcelBorderStyle.Thin;
                        sheet.Cells[chuoi].Style.Border.Top.Style = ExcelBorderStyle.Thin;
                        sheet.Cells[chuoi].Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                        sheet.Cells[chuoi].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                        sheet.Cells[chuoi].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                    }
                    sheet.Cells["A5:A5"].Value = $"Từ ngày: {tungay}";
                    sheet.Cells["A6:A6"].Value = $"Đến ngày: {denngay}";
                    foreach (var item in query)
                    {
                        sheet.Row(j).Height = 30;
                        string stt = $"A{j}:A{j}";
                        string sohoadon = $"B{j}:B{j}";
                        string ngayhoadon = $"C{j}:C{j}";
                        string manhanvien = $"D{j}:D{j}";
                        string tien = $"E{j}:E{j}";
                        string imei = $"F{j}:F{j}";
                        string masanpham = $"G{j}:G{j}";
                        string tensanpham = $"H{j}:H{j}";
                        string trangthai = $"I{j}:I{j}";

               
                        sheet.Cells[stt].Value = i;
                        sheet.Cells[sohoadon].Value = item.sohoadon;
                        sheet.Cells[ngayhoadon].Value = DateTime.Parse(item.ngayhoadon.ToString()).ToLocalTime().ToString();
                        sheet.Cells[manhanvien].Value = item.manhanvien;
                        sheet.Cells[tien].Value = item.tien;
                        sheet.Cells[imei].Value = item.imei;
                        sheet.Cells[masanpham].Value = item.masanpham;
                        sheet.Cells[tensanpham].Value = item.tensanpham;
                        sheet.Cells[trangthai].Value = item.trangthai;
                        i++;
                        j++;
                    }
                    sheet.Name = "Bao cao thong ke";

                    package.Save();
                }

                stream.Position = 0;
                var tenfile = "Bao cao thong ke";
                return File(stream, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", tenfile);
            }
        }

        [Route("/xuat-phieunhap")]
        [Authorize(Roles = "ADMINISTRATOR, STAFF")]
        public async Task<IActionResult> XuatPhieunhap(string tungay, string denngay)
        {
            ExcelPackage.LicenseContext = OfficeOpenXml.LicenseContext.NonCommercial;
            var data = new DataTable();
            var stream = new MemoryStream();
            using (var package = new ExcelPackage(stream))
            {
                var sheet = package.Workbook.Worksheets.Add($"id");
                sheet.Cells["A1:H99"].Style.Font.Name = "Times New Roman";
                sheet.Cells["A1:C1"].Merge = true;
                sheet.Column(3).Width = 25;
                sheet.Column(1).Width = 5.33;
                sheet.Column(2).Width = 11.67;
                sheet.Column(5).Width = 20;
                sheet.Cells["A1:H1"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                sheet.Cells["A1:A1"].Value = "TRƯỜNG ĐH CÔNG NGHỆ THÔNG TIN";
                sheet.Cells["A1:H1"].Merge = true;

                sheet.Cells["A2:H2"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                sheet.Cells["A2:H2"].Style.Font.Bold = true;
                sheet.Cells["A2:A2"].Value = "LAVENDER UIT WEBSHOP";
                sheet.Cells["A2:H2"].Merge = true;

                sheet.Cells["A4:H4"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                sheet.Cells["A4:H4"].Style.Font.Bold = true;
                sheet.Cells["A4:H4"].Style.Font.Size = 16;
                sheet.Cells["A4:A4"].Value = "THỐNG KÊ PHIẾU NHẬP SẢN PHẨM";
                sheet.Cells["A4:H4"].Merge = true;

                sheet.Cells["A5:H5"].Merge = true;
                sheet.Cells["A5:H5"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                sheet.Cells["A5:H5"].Style.Font.Bold = true;
                sheet.Cells["A5:A5"].Value = "Từ ngày:";

                sheet.Cells["A6:H6"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                sheet.Cells["A6:H6"].Style.Font.Bold = true;
                sheet.Cells["A6:A6"].Value = "Đến ngày:";
                sheet.Cells["A6:H6"].Merge = true;

                sheet.Row(9).Height = 41.13;
                sheet.Cells["A9:H9"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                sheet.Cells["A9:H9"].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                sheet.Cells["A9:H9"].Style.Fill.PatternType = ExcelFillStyle.Solid;
                sheet.Cells["A9:H9"].Style.Fill.BackgroundColor.SetColor(0, 186, 248, 255);
                sheet.Cells["A9:H9"].Style.Font.Bold = true;
                sheet.Cells["A9:H9"].Style.Border.Left.Style = ExcelBorderStyle.Thin;
                sheet.Cells["A9:H9"].Style.Border.Right.Style = ExcelBorderStyle.Thin;
                sheet.Cells["A9:H9"].Style.Border.Top.Style = ExcelBorderStyle.Thin;
                sheet.Cells["A9:H9"].Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                sheet.Cells["A9:A9"].Value = "STT";
                sheet.Cells["B9:B9"].Value = "Mã phiếu nhập";
                sheet.Cells["C9:C9"].Value = "Mã sản phẩm";
                sheet.Cells["D9:D9"].Value = "Mã nhà cung cấp";
                sheet.Cells["E9:E9"].Value = "Số lượng";
                sheet.Cells["F9:F9"].Value = "Ngày nhập";
                sheet.Cells["G9:G9"].Value = "Tiền nhập";
                sheet.Cells["H9:H9"].Value = "Ghi chú";

                var query = await (from x in lavenderContext.Phieunhapsanpham
                                   where x.Ngaynhap <= DateTime.Parse(denngay)
                                   && x.Ngaynhap >= DateTime.Parse(tungay)
                                   select x).ToListAsync();


                var count = query.Count();

                int i = 1;
                int j = 10;
                count = count + 10 - 1;
                string chuoi = $"A10:H{count}";
                var query2 = query.ToList();

                {
                    if (count >= 10)
                    {
                        sheet.Cells[chuoi].Style.Border.Left.Style = ExcelBorderStyle.Thin;
                        sheet.Cells[chuoi].Style.Border.Right.Style = ExcelBorderStyle.Thin;
                        sheet.Cells[chuoi].Style.Border.Top.Style = ExcelBorderStyle.Thin;
                        sheet.Cells[chuoi].Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                        sheet.Cells[chuoi].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                        sheet.Cells[chuoi].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                    }
                    sheet.Cells["A5:A5"].Value = $"Từ ngày: {tungay}";
                    sheet.Cells["A6:A6"].Value = $"Đến ngày: {denngay}";
                    foreach (var item in query)
                    {
                        sheet.Row(j).Height = 30;
                        string stt = $"A{j}:A{j}";
                        string maphieunhap = $"B{j}:B{j}";
                        string masanpham = $"C{j}:C{j}";
                        string manhacungcap = $"D{j}:D{j}";
                        string soluongnhap = $"E{j}:E{j}";
                        string ngaynhap = $"F{j}:F{j}";
                        string tiennhap = $"G{j}:G{j}";
                        string ghichu = $"H{j}:H{j}";

                  
                        sheet.Cells[stt].Value = i;
                        sheet.Cells[maphieunhap].Value = item.Maphieunhap;
                        sheet.Cells[masanpham].Value = 
                        sheet.Cells[manhacungcap].Value = item.Manhacungcap;
                        sheet.Cells[soluongnhap].Value = item.Soluongnhap;
                        sheet.Cells[ngaynhap].Value = DateTime.Parse(item.Ngaynhap.ToString()).ToLocalTime().ToString();
                        sheet.Cells[tiennhap].Value = item.Tiennhap;
                        sheet.Cells[ghichu].Value = item.Ghichu;
                        i++;
                        j++;
                    }
                    sheet.Name = "Bao cao thong ke";

                    package.Save();
                }

                stream.Position = 0;
                var tenfile = "Bao cao thong ke";
                return File(stream, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", tenfile);
            }
        }
    }
}