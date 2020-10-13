using System.Web.Optimization;

namespace Resume
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            BundleTable.EnableOptimizations = false;

            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                        "~/Scripts/popper.min.js",
                        "~/Scripts/bootstrap.js"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap-native-js").Include(
                      "~/Scripts/dist/polyfill.js",
                      "~/Scripts/dist/bootstrap-native.js"));

            bundles.Add(new ScriptBundle("~/bundles/js").Include(
                        "~/Scripts/site.js",
                        "~/Scripts/projects.js",
                        "~/Scripts/htmlEntities.js",
                        "~/Scripts/accomplishments.js",
                        "~/Scripts/homeProfile.js"));

            bundles.Add(new StyleBundle("~/bundles/mastercss").Include(
                        "~/Content/bootstrap.css",
                        "~/Content/site.css",
                        "~/Content/homeProfile.css",
                        "~/Content/accomplishments.css"));
        }
    }
}
