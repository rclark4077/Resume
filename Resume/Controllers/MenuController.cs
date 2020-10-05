using Resume.Models;
using System.Dynamic;
using System.Linq;
using System.Web.Mvc;

namespace Resume.Controllers
{
    public class MenuController : Controller
    {
        AzureNavigationEntities db = new AzureNavigationEntities();

        [ChildActionOnly]
        public PartialViewResult BuildNavigation()
        {
            var modules = from module in db.Modules
                          where module.Status == 1
                          select module;

            var submodules = from submodule in db.Submodules
                             where submodule.Status == 1
                             orderby submodule.SortOrder descending
                             select submodule;

            dynamic model = new ExpandoObject();
            model.Modules = modules;
            model.Submodules = submodules;

            return PartialView("_BuildNavigation", model);
        }

        // GET: Menu
        public RedirectToRouteResult Index()
        {
            //return RedirectToAction("Index", "Home", new { controller = "Home", action = "Index", id = "1" });
            return RedirectToRoute(new { controller = "Home", action = "Index", id = "1" });
        }
    }
}