using System.Collections;
using System.Dynamic;
using System.Linq;
using Resume.Services.Interfaces;

namespace Resume.Services.Repositories
{
    public class QualificationsService : IQualificationsService
    {
        IQualificationsService _iQualificationsService;

        public QualificationsService(IQualificationsService iQualificationsService)
        {
            _iQualificationsService = iQualificationsService;
        }

        public dynamic GetQualificationTypes(int technicalSkillTypeId = 1)
        {
            return _iQualificationsService.GetQualificationTypes(technicalSkillTypeId = 1);
        }

        public IEnumerable Index(int profileId = 1)
        {
            return _iQualificationsService.Index(profileId = 1);
        }
    }
}
