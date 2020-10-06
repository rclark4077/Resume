using Resume.ViewModels;
using System.Collections;

namespace Resume.Services.Interfaces
{
    public interface ICareerHistoryService
    {
        IEnumerable GetCompany(int id = 1);
        IEnumerable Index(int id = 1);
    }
}
