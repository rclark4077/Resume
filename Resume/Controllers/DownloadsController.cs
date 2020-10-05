using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Resume.Models;

namespace Resume.Controllers
{
    public class DownloadsController : Controller
    {
        AzureNavigationEntities db = new AzureNavigationEntities();

        // GET: Downloads [ChildActionOnly]
        [ChildActionOnly]
        public ActionResult GetDownloads()
        {
            var downloads = from submodule in db.Submodules
                            where submodule.ModuleId == 7
                            orderby submodule.SubmoduleId descending
                            select submodule;

            return PartialView("_HeaderDownloads", downloads);
        }

        // GET: Downloads
        public ActionResult Index()
        {
            return View();
        }
    }
}