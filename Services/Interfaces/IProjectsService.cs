using System.Collections;

namespace Resume.Services.Interfaces
{
    public interface IProjectsService
    {
        IEnumerable GetCompany(int id);
        IEnumerable Index(string id
                            , string LastSelectedController = null
                            , string LastSelectedAction = null
                            , string LastSelectedParam = null
                            , string LastSelectedProjectId = null);
    }
}
