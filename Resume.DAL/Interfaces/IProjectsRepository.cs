using System.Collections;

namespace Resume.DAL.Interfaces
{
    public interface IProjectsRepository
    {
        IEnumerable GetCompany(int id);
        IEnumerable Index(string id
                            , string LastSelectedController = null
                            , string LastSelectedAction = null
                            , string LastSelectedParam = null
                            , string LastSelectedProjectId = null);
    }
}
