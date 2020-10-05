using Resume.Models;
using Resume.ViewModels;
using System.Linq;
using System.Web.Mvc;

namespace Resume.Controllers
{
    public class EducationController : Controller
    {
        AzureNavigationEntities db = new AzureNavigationEntities();

        public PartialViewResult GetEducation(int id = 1)
        {
            var education = from student in db.Students
                            join institution in db.EducationalInstitutions
                                on student.InstitutionId equals institution.InstitutionId
                            where student.ProfileId == id
                            select new PriorEducationViewModel()
                            {
                                ProfileId = student.ProfileId,
                                InstitutionId = student.InstitutionId,
                                InstitutionDescription = institution.InstitutionDescription,
                                Major = student.Major,
                                Curriculum = student.Curriculum,
                                Degree = student.Degree,
                                GraduationDate = student.GraduationDate
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