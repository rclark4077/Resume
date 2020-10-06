using Resume.DAL.Interfaces;
using Resume.Services.Interfaces;

namespace Resume.Services.Repositories
{
    public class HomeService : IHomeService
    {
        IHomeRepository _iHomeRepository;

        public HomeService(IHomeRepository iHomeRepository)
        {
            _iHomeRepository = iHomeRepository;
        }

        public dynamic GetHeaderProfile(int id)
        {
            return _iHomeRepository.GetHeaderProfile(id);
        }
    }
}
