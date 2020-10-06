using System.Dynamic;

namespace Resume.DAL.Interfaces
{
    public interface IHomeRepository
    {
        dynamic GetHeaderProfile(int id);
    }
}
