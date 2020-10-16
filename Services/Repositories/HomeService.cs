using Resume.DAL.Interfaces;
using Resume.Services.Interfaces;
using System.Collections;

namespace Resume.Services.Repositories
{
    public class HomeService : IHomeService
    {
        IHomeRepository _iHomeRepository;

        public HomeService(IHomeRepository iHomeRepository)
        {
            _iHomeRepository = iHomeRepository;
        }

        public IEnumerable GetSocialNetworks(int id)
        {
            return _iHomeRepository.GetSocialNetworks(id);
        }

        public dynamic GetHeaderProfile(int id)
        {
            return _iHomeRepository.GetHeaderProfile(id);
        }
    }
}
