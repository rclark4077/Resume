using System.Dynamic;

namespace Resume.Services.Interfaces
{
    public interface IHomeService
    {
        dynamic GetHeaderProfile(int id);
    }
}
