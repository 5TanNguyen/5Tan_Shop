using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAn_555.Models;

namespace DoAn_555.Areas.User.Controllers
{
    public class ProductController : Controller
    {
        B1910293Entities db = new B1910293Entities();
        // GET: User/Product

        [HttpPost]
        public ActionResult search(string name = "")
        {
            var sanpham = db.sanphams.Where(s => s.sp_ten.Contains(name)).Select(s => new
            {
                Name = s.sp_loai,
                Price = s.sp_gia,
                Loai = s.loaisanpham.lsp_tenloai,
                SL = s.sp_soluong,
                //DVT = s.DONVITINH.TENDVT,
                HINHANH = s.sp_anh,
                MHS = s.sp_id
            });
            return Json(sanpham, JsonRequestBehavior.AllowGet);
        }



        public ActionResult cartItem()
        {
            return View();
        }

        [HttpPost]
        public JsonResult AddtoCart(int id)
        {
            List<CartItem> listcartItem;
            if (Session["ShoppingCart"] == null)
            {
                listcartItem = new List<CartItem>();
                listcartItem.Add(new CartItem
                {
                    qty = 1,
                    ProductOrder = db.sanphams.FirstOrDefault(s => s.sp_id == id)
                });
                Session["ShoppingCart"] = listcartItem;
            }
            else
            {
                bool flag = false;
                listcartItem = (List<CartItem>)Session["ShoppingCart"];
                foreach (CartItem item in listcartItem)
                {
                    if (item.ProductOrder.sp_id == id)
                    {
                        item.qty++;
                        flag = true;
                        break;
                    }
                }

                if (!flag)
                    listcartItem.Add(new CartItem { qty = 1, ProductOrder = db.sanphams.FirstOrDefault(s => s.sp_id == id) });

                Session["ShoppingCart"] = listcartItem;
            }
            int cartcount = 0;
            List<CartItem> ls = (List<CartItem>)Session["ShoppingCart"];
            foreach (CartItem item in ls)
            {
                cartcount += item.qty;
            }
            return Json(new { ItemAmount = cartcount });
        }

        public JsonResult deletecartItem(int id)
        {
            double? summ = 0.0;
            List<CartItem> ls = (List<CartItem>)Session["ShoppingCart"];
            var hsan = ls.FirstOrDefault(s => s.ProductOrder.sp_id == id);
            ls.Remove(hsan);

            foreach (var item in ls)
            {
                summ += item.qty * item.ProductOrder.sp_gia;
            };
            return Json(new
            {
                id = id,
                sum = summ,
                state = "success"
            });
        }


        [HttpPost]
        public JsonResult updateQty(int id, int qty)
        {
            var qtyy = 0;
            double? giaa = 0.00;
            double? summ = 0.00;
            if (Session["ShoppingCart"] != null)
            {
                List<CartItem> ls = (List<CartItem>)Session["ShoppingCart"];
                var hsan = ls.FirstOrDefault(s => s.ProductOrder.sp_id == id);
                hsan.qty = qty;
                qtyy = hsan.qty;
                giaa = qtyy * hsan.ProductOrder.sp_gia;
                foreach (var item in ls)
                {
                    summ += item.qty * item.ProductOrder.sp_gia;
                };
            }
            else
            {
                //neu khong co session
            }


            return Json(new
            {
                id = id,
                qty = qtyy,
                gia = giaa,
                sum = summ
            });
        }



        //////////////////// ORDER ///////////////////////////

        public ActionResult TrangThai()
        {
            var trangthai = from s in db.trangthaidondats select s;
            return View(trangthai);
        }

        public ActionResult OrderList()
        {
            if ((string.IsNullOrEmpty(Session["idUser"] as string)))
            {
                return RedirectToAction("Index", "Login");
            }
            var id = Session["idUser"].ToString();
            var kh = db.khachhangs.FirstOrDefault(s => s.kh_id == id);
            var dondat = kh.dondats.ToList();

            return View(dondat);
        }

        public JsonResult AddToOrder()
        {
            float sum = 0;
            if (Session["ShoppingCart"] != null)
            {
                List<CartItem> ls = (List<CartItem>)Session["ShoppingCart"];
                if (ls.Count <= 0)
                {
                    return Json(new
                    {
                        state = "fail"
                    });
                }
                foreach (var item in ls)
                {
                    sum += float.Parse(item.qty.ToString()) * float.Parse(item.ProductOrder.sp_gia.ToString());
                }
                //tao don dat
                var dondat = new dondat();
                dondat.dd_id = db.dondats.Max(p => p.dd_id) + 1;
                dondat.dd_makh = Session["idUser"].ToString();
                dondat.dd_matt = 1;
                dondat.dd_thoigian = DateTime.Now;
                dondat.dd_tongtien = sum;
                db.dondats.Add(dondat);
                db.SaveChanges();

                //tao chi tiet don dat
                foreach (var item in ls)
                {
                    var chitietdondat = new chitietdondat();
                    chitietdondat.ctdd_id = db.chitietdondats.Max(p => p.ctdd_id) + 1;
                    chitietdondat.ctdd_madd = dondat.dd_id;
                    chitietdondat.ctdd_masp = item.ProductOrder.sp_id;
                    chitietdondat.ctdd_soluong = item.qty;
                    chitietdondat.ctdd_giatien = item.qty * item.ProductOrder.sp_gia;
                    db.chitietdondats.Add(chitietdondat);
                    db.SaveChanges();
                }
            }
            else
            {
                //neu khong co session
            }

            return Json(new { state = "success" });
        }

        public ActionResult OrderDetail(int id)
        {
            var dd = db.dondats.FirstOrDefault(s => s.dd_id == id);
            var chitiet_dd = dd.chitietdondats.ToList();

            return View(chitiet_dd);
        }
    }
}