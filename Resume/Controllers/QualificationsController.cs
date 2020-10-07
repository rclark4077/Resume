using System.Dynamic;
using System.Web.Mvc;
using Resume.Models;
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

        [ChildActionOnly]
        public PartialViewResult GetQualificationTypes(int technicalSkillTypeId = 1)
        {
            ViewBag.Name = "Randy Clark";

            //if (String.IsNullOrEmpty(technicalSkillTypeId.ToString()))
            //{
            //    ViewBag.TechnicalSkillTypeId = 0;
            //}
            //else
            //{
            //    ViewBag.TechnicalSkillTypeId = technicalSkillTypeId;
            //};

            dynamic model = _iQualificationsRepository.GetQualificationTypes(technicalSkillTypeId);

            return PartialView("_HeaderQualifications", model);
        }

        // GET: Qualifications
        public ActionResult Index(int profileId = 1)
        {
            var qualifications = _iQualificationsRepository.Index(profileId);

            return View(qualifications);
        }
    }
}