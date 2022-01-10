using ADO_CRUD.Data;
using ADO_CRUD.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http.Description;
using System.Web.Mvc;

namespace ADO_CRUD.Controllers
{
    public class CategoryController : Controller
    {
        CategoryAdmin admin = new CategoryAdmin();
        // GET: Category
        public ActionResult Index()
        {
            IEnumerable<CategoryModel> lista = admin.GetCategories();
            return View(lista);
        }
        public ActionResult SaveCategories()
        {
            return View();
        }
        /*public ActionResult New_itm(CategoryModel model)
        {
            admin.SaveCategories(model);
            return View("SaveCategories", model);
        }*/

        public ActionResult EditCategory(int Id)
        {
            CategoryModel category = admin.GetById(Id);
            return View(category);
        }

        public ActionResult DeleteCategory()
        {
            return View();
        }

        public ActionResult DetailsCategory()
        {
            return View();
        }


        /*
         *  API DATA
         */

        public JsonResult getList()
        {
            IEnumerable<CategoryModel> lista = admin.GetCategories();
            return Json(lista.ToArray(), JsonRequestBehavior.AllowGet); ;
        }

        public Boolean save(CategoryModel modelo)
        {
            return admin.SaveCategories(modelo);

        }

        public Boolean edit(CategoryModel modelo)
        {
            return admin.EditCategory(modelo);

        }

        public Boolean delete(CategoryModel modelo)
        {
            return admin.DeleteCategory(modelo);

        }
    }
}