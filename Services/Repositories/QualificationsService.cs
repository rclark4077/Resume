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

        public dynamic GetQualificationTypes(int technicalSkillTypeId)
        {
            return _iQualificationsService.GetQualificationTypes(technicalSkillTypeId);
        }

        public IEnumerable Index(int profileId)
        {
            return _iQualificationsService.Index(profileId);
        }
    }
}
