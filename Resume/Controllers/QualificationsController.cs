using Resume.Models;
using Resume.ViewModels;
using System;
using System.Dynamic;
using System.Linq;
using System.Web.Mvc;


namespace Resume.Controllers
{
    public class QualificationsController : Controller
    {
        AzureNavigationEntities db = new AzureNavigationEntities();

        [ChildActionOnly]
        public PartialViewResult GetQualificationTypes(int? technicalSkillTypeId)
        {
            ViewBag.Name = "Randy Clark";

            if (String.IsNullOrEmpty(technicalSkillTypeId.ToString()))
            {
                ViewBag.TechnicalSkillTypeId = 0;
            }
            else
            {
                ViewBag.TechnicalSkillTypeId = technicalSkillTypeId;
            };

            Object skillTypes = from TechnicalSkillType in db.TechnicalSkillTypes
                                where (technicalSkillTypeId.ToString() == null || TechnicalSkillType.TechnicalSkillTypeId == technicalSkillTypeId)
                                select TechnicalSkillType;

            Object attributes = from att in db.ProfileAttributes
                                select att;

            dynamic model = new ExpandoObject();
            model.SkillTypes = skillTypes;
            model.PersonalAttributes = attributes;

            return PartialView("_HeaderQualifications", model);
        }

        // GET: Qualifications
        public ActionResult Index(int? profileId = 1)
        {
            Object qualifications = new Object();
            qualifications = from ts in db.TechnicalSkills
                             join tst in db.TechnicalSkillTypes
                                 on ts.TechnicalSkillTypeId equals tst.TechnicalSkillTypeId
                             where (profileId.ToString() == null || ts.ProfileId == profileId)
                                && ts.Status == 1
                             select new QualificationViewModel()
                             {
                                 TechnicalSkillTypeId = tst.TechnicalSkillTypeId,
                                 TechnicalSkillTypeDescription = tst.TechnicalSkillTypeDescription,
                                 TechnicalSkillDescription = ts.TechnicalSkillDescription
                             };

            return View(qualifications);
        }
    }
}