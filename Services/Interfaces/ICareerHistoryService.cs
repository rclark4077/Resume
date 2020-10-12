using System.Collections;
using Resume.DAL.Interfaces;

namespace Resume.Services.Interfaces
{
    public interface ICareerHistoryService
    {
        IEnumerable GetCompany(int id);
        IEnumerable Index(int id);
    }
}
