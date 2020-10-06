using System.Collections;
using Resume.DAL.Interfaces;
using Resume.Services.Interfaces;

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
