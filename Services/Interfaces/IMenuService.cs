using System.Dynamic;

namespace Resume.Services.Interfaces
{
    public interface IMenuService
    {
        dynamic BuildNavigation();
    }
}
