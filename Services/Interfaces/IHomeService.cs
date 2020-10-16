using System.Collections;

namespace Resume.Services.Interfaces
{
    public interface IHomeService
    {
        IEnumerable GetSocialNetworks(int id);
        dynamic GetHeaderProfile(int id);
    }
}
