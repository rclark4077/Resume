using System.Collections;
using System.Dynamic;

namespace Resume.Services.Interfaces
{
    public interface IQualificationsService
    {
        dynamic GetQualificationTypes(int technicalSkillTypeId = 1);
        IEnumerable Index(int profileId = 1);
    }
}
