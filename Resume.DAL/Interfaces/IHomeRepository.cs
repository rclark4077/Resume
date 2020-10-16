using System.Collections;

namespace Resume.DAL.Interfaces
{
    public interface IHomeRepository
    {
        IEnumerable GetSocialNetworks(int id);
        dynamic GetHeaderProfile(int id);
    }
}
