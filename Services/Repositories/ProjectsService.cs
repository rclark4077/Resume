using Resume.DAL.Interfaces;
using Resume.Services.Interfaces;
using System.Collections;

namespace Resume.Services.Repositories
{

    public class ProjectsService : IProjectsService
    {
        IProjectsRepository _iProductsRepository;

        public ProjectsService(IProjectsRepository iProductsRepository)
        {
            _iProductsRepository = iProductsRepository;
        }
        public IEnumerable GetCompany(int id)
        {
            return _iProductsRepository.GetCompany(id);
        }

        public IEnumerable Index(string id
                                    , string LastSelectedController = null
                                    , string LastSelectedAction = null
                                    , string LastSelectedParam = null
                                    , string LastSelectedProjectId = null)
        {
            return _iProductsRepository.Index(id
                                                , LastSelectedController = null
                                                , LastSelectedAction = null
                                                , LastSelectedParam = null
                                                , LastSelectedProjectId = null);
        }
    }
}
