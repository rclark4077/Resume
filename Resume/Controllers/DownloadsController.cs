using Resume.Services.Interfaces;
using System.Web.Mvc;

namespace Resume.Controllers
{
    public class DownloadsController : Controller
    {
        IDownloadsService _iDownloadsService;

        public DownloadsController(IDownloadsService IDownloadsService)
        {
            _iDownloadsService = IDownloadsService;
        }

        // GET: Downloads/GetDownloads
        [ChildActionOnly]
        public PartialViewResult GetDownloads()
        {
            var downloads = _iDownloadsService.GetDownloads();

            return PartialView("_HeaderDownloads", downloads);
        }

        // GET: Downloads/Index
        public ActionResult Index()
        {
            return View();
        }
    }
}