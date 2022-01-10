using ADO_CRUD.Data;
using ADO_CRUD.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ADO_CRUD.Controllers
{
    public class ProductController : Controller
    {
        ProductAdmin admin = new ProductAdmin();

        // GET: Product
        public ActionResult Index()
        {
            IEnumerable<ProductModel> lista = admin.Consultar();
            return View(lista);
        }
        public ActionResult SaveProduct()
        {
            return View();
        }

        public ActionResult EditProduct(int Id)
        {
            ProductModel product = admin.GetById(Id);

            return View(product);
        }

        public ActionResult DeleteProduct()
        {
            return View();
        }

        public ActionResult DetailsProduct(int Id)
        {
            ProductModel product = admin.GetById(Id);
            return View(product);
        }


        /*
        *  API DATA
        */

        public Boolean save(ProductModel modelo)
        {
            return admin.SaveProduct(modelo);

        }

        public Boolean edit(ProductModel modelo)
        {
            return admin.EditProduct(modelo);

        }

        public Boolean delete(ProductModel modelo)
        {
            return admin.DeleteProduct(modelo);

        }

        public JsonResult Search(string keyword)
        {
            
            IEnumerable<ProductModel> product =  admin.SearchProduct(keyword);

            // return Json(result);
            return Json(product.ToArray(), JsonRequestBehavior.AllowGet); ;
        }
    }
}