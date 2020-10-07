using System.Collections;

namespace Resume.DAL.Interfaces
{
    public interface IProductsRepository
    {
        IEnumerable GetCompany(int id = 1);
        IEnumerable Index(string id
                            , string LastSelectedController = null
                            , string LastSelectedAction = null
                            , string LastSelectedParam = null
                            , string LastSelectedProjectId = null);
    }
}
