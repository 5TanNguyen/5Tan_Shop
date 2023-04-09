using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

using PagedList;
using PagedList.Mvc;

namespace DoAn_555.Areas.Admin.Controllers  
{
    public class ManageController : Controller
    {
        // GET: Admin/Manage
        B1910293Entities db = new B1910293Entities();
        // GET: SanPham

        //------------------------------ Quản lý Sản Phẩm -------------------------//
        public ActionResult List_SanPham(int? page, string SearchString = "")
        {
            if ((string.IsNullOrEmpty(Session["idStaff"] as string)))
            {
                return RedirectToAction("Index", "Login");
            }

            if (SearchString != "")
            {
                var listt = db.sanphams.OrderBy(x => x.sp_id).Where(x => x.sp_ten.ToUpper().Contains(SearchString.ToUpper()));

                int pageSizee = 5;

                int pageNumberr = (page ?? 1);

                return View(listt.ToPagedList(pageNumberr, pageSizee));
            }
            else
            {
                if (page == null) page = 1;

                var list = (from s in db.sanphams select s).OrderBy(x => x.sp_id);

                int pageSize = 5;

                int pageNumber = (page ?? 1);

                return View(list.ToPagedList(pageNumber, pageSize));
            }
        }

        public ActionResult Create_SanPham()
        {
            if ((string.IsNullOrEmpty(Session["idStaff"] as string)))
            {
                return RedirectToAction("Index", "Login");
            }
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
                    var path = Path.Combine(Server.MapPath("~/Assets/Admin/assets/images"), fileName);
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

        // UPDATE SẢN PHẨM AJAX

        public JsonResult update_lsp_Pro(int tt, int id_pro)
        {
            var sp = db.sanphams.FirstOrDefault(s => s.sp_id == id_pro);
            sp.sp_loai = tt;
            db.SaveChanges();

            return Json(new
            {
                state = 200
            });
        }

        public JsonResult update_nsx_Pro(int tt, int id_pro)
        {
            var sp = db.sanphams.FirstOrDefault(s => s.sp_id == id_pro);
            sp.sp_nsx = tt;
            db.SaveChanges();

            return Json(new
            {
                state = 200
            });
        }


        public JsonResult update_ten_Pro(string tt, int id_pro)
        {
            var sp = db.sanphams.FirstOrDefault(s => s.sp_id == id_pro);
            sp.sp_ten = tt;
            db.SaveChanges();

            return Json(new
            {
                state = 200
            });
        }

        public JsonResult update_gia_Pro(int tt, int id_pro)
        {
            var sp = db.sanphams.FirstOrDefault(s => s.sp_id == id_pro);
            sp.sp_gia = tt;
            db.SaveChanges();

            return Json(new
            {
                state = 200
            });
        }

        public JsonResult update_soluong_Pro(int tt, int id_pro)
        {
            var sp = db.sanphams.FirstOrDefault(s => s.sp_id == id_pro);
            sp.sp_soluong = tt;
            db.SaveChanges();

            return Json(new
            {
                state = 200
            });
        }








        [HttpGet]
        public ActionResult Edit_SanPham(int? id)
        {
            if ((string.IsNullOrEmpty(Session["idStaff"] as string)))
            {
                return RedirectToAction("Index", "Login");
            }

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
            if (TryUpdateModel(spUpdate, "", new string[] { "sp_loai", "sp_nsx", "sp_ten", "sp_gia", "sp_soluong", "sp_mota", "sp_anh" }))
            {
                try
                {
                    if (fileUpload == null)
                    {
                        spUpdate.sp_anh = spUpdate_2.sp_anh;
                    }
                    else
                    {
                        //Upload file
                        var fileName = Path.GetFileName(fileUpload.FileName);
                        //Lưu đường dẫn file ảnh 
                        var path = Path.Combine(Server.MapPath("~/Assets/Admin/assets/images"), fileName);


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
                catch (RetryLimitExceededException)
                {
                    ModelState.AddModelError("", "Error Save Data");
                }
            }
            return RedirectToAction("List_SanPham");
        }

        public ActionResult Detail_SanPham(int id)
        {
            if ((string.IsNullOrEmpty(Session["idStaff"] as string)))
            {
                return RedirectToAction("Index", "Login");
            }


            if (id == null)
            {
                return HttpNotFound();
            }
            //Bao gồm tất cả danh sách chapter của book theo id chỉ định
            var viewModel = db.sanphams.SingleOrDefault(s => s.sp_id == id);
            if (viewModel == null)
            {
                return HttpNotFound();
            }
            return View(viewModel);
        }

        // Hiển thị thông tin sản phẩm cần xóa
        [HttpGet]
        public ActionResult Delete_SanPham(int id)
        {
            if ((string.IsNullOrEmpty(Session["idStaff"] as string)))
            {
                return RedirectToAction("Index", "Login");
            }

            sanpham sp = db.sanphams.SingleOrDefault(n => n.sp_id == id);
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sp);
        }

        [HttpPost, ActionName("Delete_SanPham")]
        public ActionResult DeleteConfirm_SanPham(int id)
        {
            if ((string.IsNullOrEmpty(Session["idStaff"] as string)))
            {
                return RedirectToAction("Index", "Login");
            }

            sanpham sp = db.sanphams.SingleOrDefault(n => n.sp_id == id);
            var path = Path.Combine(Server.MapPath("~/Assets/Admin/assets/images"), sp.sp_anh);

            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            // Xóa ảnh trong thư mục ~/Content/Image
            if (System.IO.File.Exists(path))
            {
                System.IO.File.Delete(path);
            }

            db.sanphams.Remove(sp);
            db.SaveChanges();
            return RedirectToAction("List_SanPham");
        }

        //------------------------------ Quản lý Nhân Viên -------------------------//

        public ActionResult List_NhanVien(int? page)
        {
            if ((string.IsNullOrEmpty(Session["idStaff"] as string)))
            {
                return RedirectToAction("Index", "Login");
            }

            if (page == null) page = 1;

            var list = (from s in db.nhanviens select s).OrderBy(x => x.nv_id);

            int pageSize = 5;

            int pageNumber = (page ?? 1);

            return View(list.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult Create_NhanVien()
        {
            if ((string.IsNullOrEmpty(Session["idStaff"] as string)))
            {
                return RedirectToAction("Index", "Login");
            }

            return View();
        }

        [HttpPost, ActionName("Create_NhanVien")]
        [ValidateAntiForgeryToken]
        [ValidateInput(true)]
        public ActionResult Create_NhanVien(nhanvien nhanvien, HttpPostedFileBase fileUpload)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    //Upload file
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    //Lưu đường dẫn file ảnh 
                    var path = Path.Combine(Server.MapPath("~/Assets/Admin/assets/images"), fileName);
                    //Kiểm tra file đã tồn tại
                    if (System.IO.File.Exists(path))
                    {
                        ModelState.AddModelError("", "Hình đã tồn tại");
                        return View(nhanvien);
                    }
                    else
                    {
                        fileUpload.SaveAs(path);
                    }
                    //Them Sach Moi
                    nhanvien nv = new nhanvien();
                    nv.nv_id = nhanvien.nv_id;
                    nv.nv_username = nhanvien.nv_username;
                    nv.nv_pwd = nhanvien.nv_pwd;
                    nv.nv_hoten = nhanvien.nv_hoten;
                    nv.nv_diachi = nhanvien.nv_diachi;
                    nv.nv_sdt = nhanvien.nv_sdt;
                    nv.nv_chucvu = nhanvien.nv_chucvu;
                    nv.nv_anh = fileUpload.FileName;
                    
                    db.nhanviens.Add(nv);
                    db.SaveChanges();
                }
            }
            catch (RetryLimitExceededException)
            {
                ModelState.AddModelError("", "Error Save Data");
            }
            //Cập nhật lại danh sách hiển thị
            var listNhanVien = from s in db.nhanviens select s;
            return RedirectToAction("List_NhanVien");
        }

        [HttpGet]
        public ActionResult Edit_NhanVien(string id)
        {
            if ((string.IsNullOrEmpty(Session["idStaff"] as string)))
            {
                return RedirectToAction("Index", "Login");
            }

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            nhanvien nv = db.nhanviens.SingleOrDefault(s => s.nv_id == id);
            return View(nv);
        }

        [HttpPost, ActionName("Edit_NhanVien")]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit_NhanVien(string id, HttpPostedFileBase fileUpload)
        {
            var nvUpdate = db.nhanviens.Find(id);
            var nvUpdate_2 = db.nhanviens.Find(id);
            if (TryUpdateModel(nvUpdate, "", new string[] { "nv_id", "nv_username", "nv_pwd", "nv_hoten", "nv_diachi", "nv_sdt", "nv_anh", "nv_chucvu" }))
            {
                try
                {
                    if (fileUpload == null)
                    {
                        nvUpdate.nv_anh = nvUpdate_2.nv_anh;
                    }
                    else
                    {
                        //Upload file
                        var fileName = Path.GetFileName(fileUpload.FileName);
                        //Lưu đường dẫn file ảnh 
                        var path = Path.Combine(Server.MapPath("~/Assets/Admin/assets/images"), fileName);


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
                        nvUpdate.nv_anh = fileUpload.FileName;
                    }

                    db.Entry(nvUpdate).State = EntityState.Modified;
                    db.SaveChanges();
                }
                catch (RetryLimitExceededException)
                {
                    ModelState.AddModelError("", "Error Save Data");
                }
            }
            return RedirectToAction("List_NhanVien");
        }

        // Hiển thị thông tin Nhân Viên cần xóa
        [HttpGet]
        public ActionResult Delete_NhanVien(string id)
        {
            if ((string.IsNullOrEmpty(Session["idStaff"] as string)))
            {
                return RedirectToAction("Index", "Login");
            }

            nhanvien nv = db.nhanviens.SingleOrDefault(n => n.nv_id == id);
            if (nv == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(nv);
        }

        [HttpPost, ActionName("Delete_NhanVien")]
        public ActionResult DeleteConfirm_NhanVien(string id)
        {
            if ((string.IsNullOrEmpty(Session["idStaff"] as string)))
            {
                return RedirectToAction("Index", "Login");
            }

            nhanvien nv = db.nhanviens.SingleOrDefault(n => n.nv_id == id);
            var path = Path.Combine(Server.MapPath("~/Assets/Admin/assets/images"), nv.nv_anh);

            if (nv == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            // Xóa ảnh trong thư mục ~/Content/Image
            if (System.IO.File.Exists(path))
            {
                System.IO.File.Delete(path);
            }

            db.nhanviens.Remove(nv);
            db.SaveChanges();
            return RedirectToAction("List_NhanVien");
        }


        // ĐƠN ĐẶT

        public ActionResult List_DonDat()
        {
            if ((string.IsNullOrEmpty(Session["idStaff"] as string)))
            {
                return RedirectToAction("Index", "Login");
            }

            var list_DonDat = db.dondats.ToList();
            return View(list_DonDat);
        }
        public ActionResult List_HoaDon()
        {
            if ((string.IsNullOrEmpty(Session["idStaff"] as string)))
            {
                return RedirectToAction("Index", "Login");
            }

            var list_HoaDon = from s in db.hoadons select s;
            return View(list_HoaDon);
        }

        ////////// Test kết nối CSDL đã update


        public ActionResult List_ChucVu()
        {
            if ((string.IsNullOrEmpty(Session["idStaff"] as string)))
            {
                return RedirectToAction("Index", "Login");
            }

            var list_ChucVu = from s in db.chucvus select s;
            return View(list_ChucVu);
        }

        ////////// /Test kết nối CSDL đã update
        ///

        public JsonResult updateStateOrder(int id_state, int id_order)
        {
            var order = db.dondats.FirstOrDefault(s => s.dd_id == id_order);
            order.dd_matt = id_state;

            //neu trang thai giao hang thanh cong
            if (id_state == 3)
            {

                //tao hoa don
                var bill = new hoadon();
                bill.hd_id = db.hoadons.Max(p => p.hd_id) + 1;
                bill.hd_makh = order.dd_makh;
                bill.hd_manv = Session["idStaff"].ToString();
                bill.hd_ngaylap = DateTime.Now;
                bill.hd_tongtien = order.dd_tongtien;
                db.hoadons.Add(bill);
                db.SaveChanges();

                //chinh sua so luong ton kho
                foreach (var item in order.chitietdondats)
                {
                    //them chi tiet hoa don
                    var chitiet = new chitiethoadon();
                    chitiet.cthd_id = db.chitiethoadons.Max(p => p.cthd_id) + 1;
                    chitiet.cthd_masp = item.ctdd_masp;
                    chitiet.cthd_mahd = bill.hd_id;
                    chitiet.cthd_soluong = item.ctdd_soluong;
                    chitiet.cthd_giatien = item.ctdd_giatien;
                    db.chitiethoadons.Add(chitiet);
                    var product = db.sanphams.FirstOrDefault(s => s.sp_id == item.ctdd_masp);
                    product.sp_soluong = product.sp_soluong - item.ctdd_soluong;
                    db.SaveChanges();
                }




            }


            return Json(new
            {
                state = 200
            });
        }

    }
}