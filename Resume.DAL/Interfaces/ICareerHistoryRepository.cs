using Resume.ViewModel;
using System.Collections;

namespace Resume.DAL.Interfaces
{
    public interface ICareerHistoryRepository
    {
        IEnumerable GetCompany(int id = 1);
        IEnumerable Index(int id = 1);
    }
}
