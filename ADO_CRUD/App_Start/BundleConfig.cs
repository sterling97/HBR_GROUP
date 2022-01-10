using System.Web;
using System.Web.Optimization;

namespace ADO_CRUD
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js",
                        "~/Scripts/jquery.dataTables.min.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css",
                      "~/Content/jquery.dataTables.min.css"));

            bundles.Add(new ScriptBundle("~/bundles/services").Include(
                        "~/Scripts/services/category.js",
                        "~/Scripts/services/product.js"));

            bundles.Add(new ScriptBundle("~/bundles/product-create-core").Include(
                        "~/Scripts/core/product/create.js"));

            bundles.Add(new ScriptBundle("~/bundles/product-edit-core").Include(
                        "~/Scripts/core/product/edit.js"));

            bundles.Add(new ScriptBundle("~/bundles/product-index-core").Include(
                        "~/Scripts/core/product/index.js"));

            bundles.Add(new ScriptBundle("~/bundles/category-edit-core").Include(
                        "~/Scripts/core/category/edit.js"));

            bundles.Add(new ScriptBundle("~/bundles/category-index-core").Include(
                        "~/Scripts/core/category/index.js"));

            bundles.Add(new ScriptBundle("~/bundles/category-create-core").Include(
                        "~/Scripts/core/category/create.js"));
        }
    }
}
