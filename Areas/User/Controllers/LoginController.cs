using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAn_555.Areas.User.Controllers
{
    public class LoginController : BaseController
    {
        B1910293Entities db = new B1910293Entities();
        // GET: User/Login
        public ActionResult Index()
        {
            checkLogin();
            if (Session["idUser"] != null)
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
        public ActionResult Login(string kh_username, string kh_pwd, string login_remember)
        {
            if (ModelState.IsValid)
            {
                var data = db.khachhangs.Where(s => s.kh_username.Equals(kh_username) && s.kh_pwd.Equals(kh_pwd)).ToList();
                if (data.Count() > 0)
                {
                    //add session
                    Session["Fullname"] = data.FirstOrDefault().kh_hoten;
                    //Session["Email"] = data.FirstOrDefault().kh_email;
                    Session["sdt"] = data.FirstOrDefault().kh_sdt;
                    Session["Addr"] = data.FirstOrDefault().kh_diachi;
                    Session["idUser"] = data.FirstOrDefault().kh_id;
                    if (login_remember == "true")
                    {
                        HttpCookie userCookie = new HttpCookie("userCookie");
                        userCookie.Values.Add("userid", data.FirstOrDefault().kh_id);
                        userCookie.Values.Add("sdt", data.FirstOrDefault().kh_sdt);
                        //userCookie.Values.Add("Email", data.FirstOrDefault().EMAIL);

                        userCookie.Values.Add("Addr", data.FirstOrDefault().kh_diachi);

                        userCookie.Values.Add("Fullname", data.FirstOrDefault().kh_hoten);
                        userCookie.Expires = DateTime.Now.AddMinutes(120);
                        Response.Cookies.Add(userCookie);
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Tên đăng nhập hoặc mật khẩu không đúng!");
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

        public ActionResult Change_PWD()
        {
            if((string.IsNullOrEmpty(Session["idUser"] as string)))
            {
                return RedirectToAction("Index");
            }
            var id = Session["idUser"].ToString();
            var User = db.khachhangs.FirstOrDefault(s => s.kh_id == id);
            if(User != null)
            {
                return View(User);
            }    
            else
            {
                RedirectToAction("Index");
            }
            return View();
        }

        [HttpPost]
        public ActionResult Change_PWD( string old_pwd, string kh_pwd, string re_pwd)
        {
            var id = Session["idUser"].ToString();
            var User = db.khachhangs.FirstOrDefault(s => s.kh_id == id);
            if(old_pwd != User.kh_pwd)
            {
                ModelState.AddModelError("error", "Mật khẩu cũ không đúng!!");
                return View("Change_PWD");
            }    
            if(kh_pwd != re_pwd)
            {
                return HttpNotFound();
            }
            if (kh_pwd != null)
            {
                User.kh_pwd = kh_pwd;
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }
    }

}