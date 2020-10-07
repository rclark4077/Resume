using System.Collections;
using Resume.DAL.Interfaces;
using Resume.Services.Interfaces;

namespace Resume.Services.Repositories
{

    public class ProductsService : IProductsService
    {
        IProductsRepository _iProductsRepository;

        public ProductsService(IProductsRepository iProductsRepository)
        {
            _iProductsRepository = iProductsRepository;
        }
        public IEnumerable GetCompany(int id = 1)
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
