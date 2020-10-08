using Resume.Services.Interfaces;
using Resume.ViewModel;
using System.Web.Mvc;

namespace Resume.Controllers
{
    public class ProjectsController : Controller
    {
        IProductsService _iProductsService;

        public ProjectsController(IProductsService iProductsService)
        {
            _iProductsService = iProductsService;
        }

        [ChildActionOnly]
        public PartialViewResult GetCompany(int id = 1)
        {
            //  !!! Important, this is an exact duplicate of CareerHistoryController/GetCompany
            //      the reason for this is that the shared _ResumeLayout content page action links can only pass 1 controller
            ViewBag.Name = "Randy Clark";
            ViewBag.Id = id;

            if (ViewBag.SelectedCompanyId != "" && ViewBag.SelectedCompanyId != null)
            {
                ViewBag.Id = ViewBag.SelectedCompanyId;
            }

            var company = _iProductsService.GetCompany(id);

            return PartialView("_HeaderCompanies", company);
        }
        // GET: Projects
        public ActionResult Index(string Id = null, string LastSelectedController = null, string LastSelectedAction = null, string LastSelectedParam = null, string LastSelectedProjectId = null)
        {
            ViewBag.LastSelectedController = LastSelectedController;
            ViewBag.LastSelectedAction = LastSelectedAction;
            ViewBag.LastSelectedParam = LastSelectedParam;
            ViewBag.LastSelectedProjectId = LastSelectedProjectId;
            ViewBag.SelectedCompanyId = Id;
            ViewBag.SomeId = Id;

            var project = _iProductsService.Index(Id
                                                    , LastSelectedController
                                                    , LastSelectedAction
                                                    , LastSelectedParam
                                                    , LastSelectedProjectId);

            return View(project);
        }
        [HttpPost]
        public ActionResult GetControllerAction(UrlSelectionViewModel url)
        {
            return RedirectToAction("Index", "Projects", new
            {
                id = url.Param,
                LastSelectedController = url.Controller,
                LastSelectedAction = url.Action,
                LastSelectedParam = url.Param,
                LastSelectedProjectId = url.ProjectId.ToString()
            }
            );
        }
    }
}