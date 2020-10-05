using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using Resume.Models;
using Resume.ViewModels;

namespace Resume.Controllers
{
    public class EducationController : Controller
    {
        AzureNavigationEntities db = new AzureNavigationEntities();

        public PartialViewResult GetEducation(int id=1)
        {
            var education = from student in db.Students
                            join institution in db.EducationalInstitutions
                                on student.InstitutionId equals institution.InstitutionId
                            where student.ProfileId == id
                            select new PriorEducationViewModel()
                            {
                                ProfileId               = student.ProfileId,
                                InstitutionId           = student.InstitutionId,
                                InstitutionDescription  = institution.InstitutionDescription,
                                Major                   = student.Major,
                                Curriculum              = student.Curriculum,
                                Degree                  = student.Degree,
                                GraduationDate          = student.GraduationDate
                            };

            return PartialView("_HeaderEducation", education);
        }

        // GET: education
        public ActionResult Index()
        {
            return View();
        }
    }
}