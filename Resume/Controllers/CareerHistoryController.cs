using System.Web.Mvc;
using Resume.Services.Interfaces;

namespace Resume.Controllers
{
    public class CareerHistoryController : Controller
    {
        private ICareerHistoryService _iCareerHistoryService;

        //  dependency being injected into this controller object
        //  find reference to the Type in App_Start/Unity.config
        public CareerHistoryController(ICareerHistoryService iCareerHistoryService)
        {
            _iCareerHistoryService = iCareerHistoryService;
        }

        //  !!! Important, this is an exact duplicate of ProjectController/GetCompany
        //      the reason for this is that the shared _ResumeLayout content page action links can only pass 1 controller
        [ChildActionOnly]
        public PartialViewResult GetCompany(int id = 1)
        {
            ViewBag.Name = "Randy Clark";
            ViewBag.Id = id;

            if (ViewBag.SelectedCompanyId != "" && ViewBag.SelectedCompanyId != null)
            {
                ViewBag.Id = ViewBag.SelectedCompanyId;
            }

            var company = _iCareerHistoryService.GetCompany(id);

            return PartialView("_HeaderCareerHistoryCompanies", company);
        }

        // GET: CareerHistory
        public ActionResult Index(int id = 1)
        {
            ViewBag.Id = id;

            var careerposition = _iCareerHistoryService.Index(id);

            return View(careerposition);
        }
    }
}
