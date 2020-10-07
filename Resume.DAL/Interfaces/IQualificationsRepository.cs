using System.Collections;
using System.Dynamic;

namespace Resume.DAL.Interfaces
{
    public interface IQualificationsRepository
    {
        dynamic GetQualificationTypes(int technicalSkillTypeId = 1);
        IEnumerable Index(int profileId = 1);
    }
}
