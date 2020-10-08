using System.Dynamic;
using System.Web.Mvc;
using Resume.ViewModels;
using Resume.DAL.Interfaces;

namespace Resume.Controllers
{
    public class QualificationsController : Controller
    {
        IQualificationsRepository _iQualificationsRepository;

        public QualificationsController(IQualificationsRepository iQalificationsRepository)
        {
            _iQualificationsRepository = iQalificationsRepository;
        }
        // GET: Qualifications/GetQualificationTypes/1
        [ChildActionOnly]
        public PartialViewResult GetQualificationTypes(int technicalSkillTypeId = 1)
        {
            ViewBag.Name = "Randy Clark";

            dynamic model = _iQualificationsRepository.GetQualificationTypes(technicalSkillTypeId);

            return PartialView("_HeaderQualifications", model);
        }

        // GET: Qualifications/Index/1
        public ActionResult Index(int profileId = 1)
        {
            var qualifications = _iQualificationsRepository.Index(profileId);

            return View(qualifications);
        }
    }
}