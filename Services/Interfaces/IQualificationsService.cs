using System.Collections;
using System.Dynamic;

namespace Resume.Services.Interfaces
{
    public interface IQualificationsService
    {
        dynamic GetQualificationTypes(int technicalSkillTypeId);
        IEnumerable Index(int profileId);
    }
}
