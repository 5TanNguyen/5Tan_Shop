using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAn_555.Areas.User.Controllers
{
    public class ProfileController : BaseController
    {
        B1910293Entities db = new B1910293Entities();
        // GET: User/Profile
        public ActionResult Index()
        {
            if ((string.IsNullOrEmpty(Session["idUser"] as string)))
            {
                return RedirectToAction("Index", "Login");
            }
            var id = Session["idUser"].ToString();
            var User = db.khachhangs.FirstOrDefault(s => s.kh_id == id);
            if (User != null)
            {
                return View(User);
            }
            else
            {
                RedirectToAction("Index");
            }
            return View();
        }

        [HttpGet]
        public ActionResult Edit_Profile(string id)
        {
            khachhang kh = db.khachhangs.SingleOrDefault(s => s.kh_id == id);
            return View(kh);
        }

        [HttpPost, ActionName("Edit_Profile")]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit_Profile(string id, HttpPostedFileBase fileUpload)
        {
            var spUpdate = db.khachhangs.Find(id);
            var spUpdate_2 = db.khachhangs.Find(id);
            if (TryUpdateModel(spUpdate, "", new string[] { "kh_username", "kh_pwd", "kh_hoten", "kh_diachi", "kh_sdt", "kh_anh", "kh_loai" }))
            {
                try
                {
                    if (fileUpload == null)
                    {
                        spUpdate.kh_anh = spUpdate_2.kh_anh;
                    }
                    else
                    {
                        //Upload file
                        var fileName = Path.GetFileName(fileUpload.FileName);
                        //Lưu đường dẫn file ảnh 
                        var path = Path.Combine(Server.MapPath("~/Assets/User/assets/images"), fileName);


                        //Kiểm tra file đã tồn tại
                        if (System.IO.File.Exists(path))
                        {
                            ModelState.AddModelError("", "Hình đã tồn tại");
                            //return View(sanpham);
                        }
                        else
                        {
                            fileUpload.SaveAs(path);
                        }
                        spUpdate.kh_anh = fileUpload.FileName;
                    }

                    db.Entry(spUpdate).State = EntityState.Modified;
                    db.SaveChanges();
                }
                catch (RetryLimitExceededException)
                {
                    ModelState.AddModelError("", "Error Save Data");
                }
            }
            return RedirectToAction("Index");
        }
    }
}