using System.Collections;
using System.Linq;
using Resume.DAL.Interfaces;
using Resume.DAL.Models;
using Resume.ViewModel;

namespace Resume.DAL.Repositories
{
    public class EducationRepository : IEducationRepository
    {
        AzureEntities db = new AzureEntities();

        public IEnumerable GetEducation(int id = 1)
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

            return education;
        }
    }
}
