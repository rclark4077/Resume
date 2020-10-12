using Resume.ViewModel;
using System.Collections;

namespace Resume.DAL.Interfaces
{
    public interface ICareerHistoryRepository
    {
        IEnumerable GetCompany(int id);
        IEnumerable Index(int id);
    }
}
