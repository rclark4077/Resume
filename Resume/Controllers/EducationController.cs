using Resume.Services.Interfaces;
using System.Web.Mvc;

namespace Resume.Controllers
{
    public class EducationController : Controller
    {
        IEducationService _iEducationService;

        public EducationController(IEducationService iEducationService)
        {
            _iEducationService = iEducationService;
        }

        //  GET: Education/GetEducation(1)
        [ChildActionOnly]
        public PartialViewResult GetEducation(int id = 1)
        {
            var education = _iEducationService.GetEducation(id);

            return PartialView("_HeaderEducation", education);
        }

        // GET: education
        public ActionResult Index()
        {
            return View();
        }
    }
}