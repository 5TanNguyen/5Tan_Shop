using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using PagedList;
using PagedList.Mvc;

namespace DoAn_555.Areas.User.Controllers
{
    public class HomeController : BaseController
    {
        B1910293Entities db = new B1910293Entities();
        // GET: User/Home
        public ActionResult Index(int? page, string SearchString="")
        {
            checkLogin();

            if (SearchString != "")
            {
                var listt = db.sanphams.OrderBy(x => x.sp_id).Where(x => x.sp_ten.ToUpper().Contains(SearchString.ToUpper()));

                int pageSizee = 8;

                int pageNumberr = (page ?? 1);

                return View(listt.ToPagedList(pageNumberr, pageSizee));
            }

            else
            {
                if (page == null) page = 1;

                var list = (from s in db.sanphams select s).OrderBy(x => x.sp_id);

                int pageSize = 8;

                int pageNumber = (page ?? 1);

                return View(list.ToPagedList(pageNumber, pageSize));

            }
        }


        public ActionResult Detail_SanPham(int id)
        {
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
    }
}