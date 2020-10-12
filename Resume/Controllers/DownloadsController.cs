using Resume.Services.Interfaces;
using System.Web.Mvc;
using System.Web.SessionState;

namespace Resume.Controllers
{
    [SessionState(SessionStateBehavior.Default)]
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
            var downloads = _iDownloadsService.GetDownloads(1);

            return PartialView("_HeaderDownloads", downloads);
        }

        // GET: Downloads/Index
        public ActionResult Index()
        {
            return View();
        }
    }
}