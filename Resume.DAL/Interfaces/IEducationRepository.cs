using System.Collections;

namespace Resume.DAL.Interfaces
{
    public interface IEducationRepository
    {
        IEnumerable GetEducation(int id = 1);
    }
}
