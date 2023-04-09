using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAn_555.Areas.User.Controllers
{
    public class RegisterController : Controller
    {
        B1910293Entities db = new B1910293Entities();
        // GET: User/Register
        public ActionResult Register_KhachHang()
        {
            return View();
        }

        [HttpPost, ActionName("Register_KhachHang")]
        [ValidateAntiForgeryToken]
        [ValidateInput(true)]
        public ActionResult Register_KhachHang(khachhang khachhang, HttpPostedFileBase fileUpload)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    //Upload file
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    //Lưu đường dẫn file ảnh 
                    var path = Path.Combine(Server.MapPath("~/Assets/User/assets/images"), fileName);
                    //Kiểm tra file đã tồn tại
                    if (System.IO.File.Exists(path))
                    {
                        ModelState.AddModelError("", "Hình đã tồn tại");
                        return View(khachhang);
                    }
                    else
                    {
                        fileUpload.SaveAs(path);
                    }
                    //Them Khach hang Moi
                    khachhang kh = new khachhang();
                    kh.kh_id = khachhang.kh_id;
                    kh.kh_username = khachhang.kh_username;
                    kh.kh_pwd = khachhang.kh_pwd;
                    kh.kh_hoten = khachhang.kh_hoten;
                    kh.kh_diachi = khachhang.kh_diachi;
                    kh.kh_sdt = khachhang.kh_sdt;
                    kh.kh_anh = fileUpload.FileName;
                    kh.kh_loai = khachhang.kh_loai;
                    
                    db.khachhangs.Add(kh);
                    db.SaveChanges();
                }
            }
            catch (RetryLimitExceededException)
            {
                ModelState.AddModelError("", "Error Save Data");
            }
            //Cập nhật lại danh sách hiển thị
            //var listSanPham = from s in db.sanphams select s;
            return RedirectToAction("Index", "Login");
        }
    }
}