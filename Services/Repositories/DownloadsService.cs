using System.Collections;
using Resume.DAL.Interfaces;
using Resume.Services.Interfaces;

namespace Resume.Services.Repositories
{
    public class DownloadsService : IDownloadsService
    {
        IDownloadsRepository _iDownLoadRepository;

        public DownloadsService(IDownloadsRepository iDownloadRepository)
        {
            _iDownLoadRepository = iDownloadRepository;
        }

        public IEnumerable GetDownloads(int Id)
        {
            return _iDownLoadRepository.GetDownloads(Id);
        }
    }
}
