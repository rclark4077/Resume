using System.Collections;
using Resume.Services.Interfaces;
using Resume.DAL.Interfaces;
using Resume.ViewModels;

namespace Resume.Services.Repositories
{
    public class CareerHistoryService : ICareerHistoryService
    {
        private ICareerHistoryRepository _iCareerHistoryRepository;

        public CareerHistoryService(ICareerHistoryRepository iCareerHistoryRepository)
        {
            _iCareerHistoryRepository = iCareerHistoryRepository;
        }

        public IEnumerable GetCompany(int id = 1)
        {
            return _iCareerHistoryRepository.GetCompany(id);
        }

        public IEnumerable Index(int id = 1)
        {
            return _iCareerHistoryRepository.Index(id);
        }
    }
}
