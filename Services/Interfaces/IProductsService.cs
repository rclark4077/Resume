using System.Collections;

namespace Resume.Services.Interfaces
{
    public interface IProductsService
    {
        IEnumerable GetCompany(int id = 1);
        IEnumerable Index(string id
                            , string LastSelectedController = null
                            , string LastSelectedAction = null
                            , string LastSelectedParam = null
                            , string LastSelectedProjectId = null);
    }
}
