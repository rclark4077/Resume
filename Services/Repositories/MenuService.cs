using Resume.DAL.Interfaces;
using Resume.Services.Interfaces;

namespace Resume.Services.Repositories
{
    public class MenuService : IMenuService
    {
        IMenuRepository _iMenuRepository;

        public MenuService(IMenuRepository iMenuRepository)
        {
            _iMenuRepository = iMenuRepository;
        }

        public dynamic BuildNavigation()
        {
            return _iMenuRepository.BuildNavigation();
        }
    }
}
