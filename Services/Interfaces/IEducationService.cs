using System.Collections;

namespace Resume.Services.Interfaces
{
    public interface IEducationService
    {
        IEnumerable GetEducation(int id = 1);
    }
}
