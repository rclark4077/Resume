using System.Collections;

namespace Resume.Services.Interfaces
{
    public interface ICareerHistoryService
    {
        IEnumerable GetCompany(int id);
        IEnumerable Index(int id);
    }
}
