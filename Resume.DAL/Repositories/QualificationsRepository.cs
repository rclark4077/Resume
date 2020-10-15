using System.Collections;
using System.Linq;
using System.Dynamic;
using Resume.DAL.Models;
using Resume.DAL.Interfaces;
using Resume.ViewModel;

namespace Resume.DAL.Repositories
{
    public class QualificationsRepository : IQualificationsRepository
    {
        AzureEntities db = new AzureEntities();

        public dynamic GetQualificationTypes(int technicalSkillTypeId)
        {

            var skillTypes = from TechnicalSkillType in db.TechnicalSkillTypes
                                where (technicalSkillTypeId.ToString() == null || TechnicalSkillType.TechnicalSkillTypeId == technicalSkillTypeId)
                                select TechnicalSkillType;

            var attributes = from att in db.ProfileAttributes
                                select att;

            dynamic model = new ExpandoObject();
            model.SkillTypes = skillTypes;
            model.PersonalAttributes = attributes;

            return model;
        }

        public IEnumerable Index(int profileId)
        {
            var qualifications = from ts in db.TechnicalSkills
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

            return qualifications;
        }
    }
}
