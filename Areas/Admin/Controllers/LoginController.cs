using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAn_555.Areas.Admin.Controllers
{
    public class LoginController : BaseController
    {
        B1910293Entities db = new B1910293Entities();
        // GET: Admin/Login
        public ActionResult Index()
        {
            checkLogin();
            if(Session["isStaff"] != null)
            {
                return RedirectToAction("Index", "Home");
            }    
            else
            {
                return View();
            }    
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string nv_username, string nv_pwd, string login_remember)
        {
            if(ModelState.IsValid)
            {
                var data = db.nhanviens.Where(s => s.nv_username.Equals(nv_username) && s.nv_pwd.Equals(nv_pwd)).ToList();
                if(data.Count() > 0)
                {
                    //add session
                    Session["staffFullname"] = data.FirstOrDefault().nv_hoten;
                    Session["CV"] = data.FirstOrDefault().nv_chucvu;
                    Session["idStaff"] = data.FirstOrDefault().nv_id;
                    if(login_remember == "true")
                    {
                        HttpCookie staffCookie = new HttpCookie("staffCookie");
                        staffCookie.Values.Add("idStaff", data.FirstOrDefault().nv_id);
                        staffCookie.Values.Add("CV", data.FirstOrDefault().nv_chucvu.ToString());
                        staffCookie.Values.Add("staffFullname", data.FirstOrDefault().nv_hoten);
                        staffCookie.Expires = DateTime.Now.AddMinutes(120);
                        Response.Cookies.Add(staffCookie);
                    }    
                }    
                else
                {
                    ModelState.AddModelError("", "Tên đăng nhập hoặc mật khẩu không đúng !!");
                    return RedirectToAction("Index");
                }    
            }
            return RedirectToAction("Index", "Home");
        }

        public ActionResult Logout()
        {
            Session.Clear();
            Response.Cookies["staffCookie"].Expires = DateTime.Now.AddDays(-1);

            return RedirectToAction("Index", "Login");
        }
    }
}