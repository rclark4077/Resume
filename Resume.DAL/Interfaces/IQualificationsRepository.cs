using System.Collections;
using System.Dynamic;

namespace Resume.DAL.Interfaces
{
    public interface IQualificationsRepository
    {
        dynamic GetQualificationTypes(int technicalSkillTypeId);
        IEnumerable Index(int profileId);
    }
}
