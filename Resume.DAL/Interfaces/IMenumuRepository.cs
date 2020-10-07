using System.Dynamic;

namespace Resume.DAL.Interfaces
{
    public interface IMenuRepository
    {
        dynamic BuildNavigation();
    }
}
