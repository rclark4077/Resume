using System.Collections;

namespace Resume.DAL.Interfaces
{
    public interface IDownloadsRepository
    {
        IEnumerable GetDownloads();
    }
}
