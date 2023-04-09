using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace DoAn_555.Controllers
{
    public class SanPhamController : Controller
    {
        B1910293Entities db = new B1910293Entities();
        // GET: SanPham
        public ActionResult List_SanPham()
        {
            var listSanPham = from s in db.sanphams select s;
            return View(listSanPham);
        }

        public ActionResult Create_SanPham()
        {
            return View();
        }

        [HttpPost, ActionName("Create_SanPham")]
        [ValidateAntiForgeryToken]
        [ValidateInput(true)]
        public ActionResult Create_SanPham(sanpham sanpham, HttpPostedFileBase fileUpload)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    //Upload file
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    //Lưu đường dẫn file ảnh 
                    var path = Path.Combine(Server.MapPath("~/Content/Image"), fileName);
                    //Kiểm tra file đã tồn tại
                    if (System.IO.File.Exists(path))
                    {
                        ModelState.AddModelError("", "Hình đã tồn tại");
                        return View(sanpham);
                    }
                    else
                    {
                        fileUpload.SaveAs(path);
                    }
                    //Them Sach Moi
                    sanpham sp = new sanpham();
                    sp.sp_id = db.sanphams.Max(p => p.sp_id) + 1;
                    sp.sp_loai = sanpham.sp_loai;
                    sp.sp_nsx = sanpham.sp_nsx;
                    sp.sp_ten = sanpham.sp_ten;
                    sp.sp_gia = sanpham.sp_gia;
                    sp.sp_soluong = sanpham.sp_soluong;
                    sp.sp_mota = sanpham.sp_mota;
                    sp.sp_anh = fileUpload.FileName;
                    db.sanphams.Add(sp);
                    db.SaveChanges();
                }
            }
            catch (RetryLimitExceededException)
            {
                ModelState.AddModelError("", "Error Save Data");
            }
            //Cập nhật lại danh sách hiển thị
            var listSanPham = from s in db.sanphams select s;
            return RedirectToAction("List_SanPham");
        }

        [HttpGet]
        public ActionResult Edit_SanPham(int ? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            sanpham sp = db.sanphams.SingleOrDefault(s => s.sp_id == id);
            return View(sp);
        }

        [HttpPost, ActionName("Edit_SanPham")]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit_SanPham(int id, HttpPostedFileBase fileUpload)
        {
            var spUpdate = db.sanphams.Find(id);
            var spUpdate_2 = db.sanphams.Find(id);
            if (TryUpdateModel(spUpdate, "", new string[] { "sp_loai", "sp_nsx", "sp_ten", "sp_gia", "sp_soluong", "sp_mota", "sp_anh"}))
            {
                try
                {
                    if (fileUpload  ==  null)
                    {
                        spUpdate.sp_anh = spUpdate_2.sp_anh;
                    }
                    else
                    {
                        //Upload file
                        var fileName = Path.GetFileName(fileUpload.FileName);
                        //Lưu đường dẫn file ảnh 
                        var path = Path.Combine(Server.MapPath("~/Content/Image"), fileName);


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
                        spUpdate.sp_anh = fileUpload.FileName;
                    }
               
                    db.Entry(spUpdate).State = EntityState.Modified;
                    db.SaveChanges();
                }
                catch(RetryLimitExceededException)
                {
                    ModelState.AddModelError("", "Error Save Data");
                }
            }
            return RedirectToAction("List_SanPham");
        }

        // Hiển thị thông tin sản phẩm cần xóa
        [HttpGet]
        public ActionResult Delete_SanPham(int id)
        {
            sanpham sp = db.sanphams.SingleOrDefault(n => n.sp_id == id);
            if( sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sp);
        }

        [HttpPost, ActionName("Delete_SanPham")]
        public ActionResult DeleteConfirm_SanPham(int id)
        {
            sanpham sp = db.sanphams.SingleOrDefault(n => n.sp_id == id);
            var path = Path.Combine(Server.MapPath("~/Content/Image"), sp.sp_anh);

            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }    
            // Xóa ảnh trong thư mục ~/Content/Image
            if(System.IO.File.Exists(path))
            {
                System.IO.File.Delete(path);
            }

            db.sanphams.Remove(sp);
            db.SaveChanges();
            return RedirectToAction("List_SanPham");
        }
    }
}