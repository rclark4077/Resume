using Resume.Models;
using Resume.ViewModels;
using System.Linq;
using System.Web.Mvc;

namespace Resume.Controllers
{
    public class DownloadsController : Controller
    {
        AzureNavigationEntities db = new AzureNavigationEntities();

        // GET: Downloads [ChildActionOnly]
        [ChildActionOnly]
        public ActionResult GetDownloads()
        {
            var downloads = from sub in db.Submodules
                                join download in db.Downloads
                                    on sub.SubmoduleId equals download.SubmoduleId
                            join urlsourcetype in db.UrlSourceTypes
                                on download.UrlSourceTypeId equals urlsourcetype.UrlSourceTypeId
                            where sub.ModuleId == 6
                            orderby sub.SubmoduleId descending
                            select new SubmoduleViewModel()
                            {
                                SubmoduleDescription = sub.SubmoduleDescription,
                                SecurityLevel = sub.SecurityLevel,
                                UrlSourceType = urlsourcetype.UrlSourceTypeDescription,
                                UrlSourceTypeId = urlsourcetype.UrlSourceTypeId,
                                DownloadUrl = download.DownloadUrl,
                                Status = sub.Status
                            };

            return PartialView("_HeaderDownloads", downloads);
        }

        // GET: Downloads
        public ActionResult Index()
        {
            return View();
        }
    }
}