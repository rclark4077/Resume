using Resume.Services.Interfaces;
using System.Web.Mvc;

namespace Resume.Controllers
{
    public class HomeController : Controller
    {
        IHomeService _iHomeService;

        public HomeController(IHomeService iHomeService)
        {
            _iHomeService = iHomeService;
        }

        //  GET: Home/GetHeaderProfile/1
        [ChildActionOnly]
        public PartialViewResult GetHeaderProfile(int id = 1)
        {
            ViewBag.Name = "Randy Clark";
            ViewBag.Controller = "Home";

            var model = _iHomeService.GetHeaderProfile(id);

            return PartialView("_HeaderProfile", model);
        }

        //  GET: Home/Index/1
        public ActionResult Index(int id = 1)
        {
            return View();
        }
    }
}