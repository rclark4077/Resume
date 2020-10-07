using System.Web.Mvc;
using Resume.Services.Interfaces;

namespace Resume.Controllers
{
    public class MenuController : Controller
    {
        IMenuService _iMenuService;

        public MenuController(IMenuService iMenuSerivce)
        {
            _iMenuService = iMenuSerivce;
        }

        [ChildActionOnly]
        public PartialViewResult BuildNavigation()
        {
            var model = _iMenuService.BuildNavigation();

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