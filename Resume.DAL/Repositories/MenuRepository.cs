using Resume.DAL.Interfaces;
using Resume.DAL.Models;
using System.Dynamic;
using System.Linq;

namespace Resume.DAL.Repositories
{
    public class MenuRepository : IMenuRepository
    {
        AzureEntities db = new AzureEntities();

        public dynamic BuildNavigation()
        {
            var modules = from module in db.Modules
                          where module.Status == 1
                          select module;

            var submodules = from submodule in db.Submodules
                             where submodule.Status == 1
                             orderby submodule.SortOrder descending
                             select submodule;

            dynamic model = new ExpandoObject();
            model.Modules = modules;
            model.Submodules = submodules;

            return model;
        }
    }
}
