using Resume.DAL.Interfaces;
using Resume.DAL.Models;
using Resume.ViewModel;
using System.Collections;
using System.Linq;

namespace Resume.DAL.Repositories
{
    public class DownloadsRepository : IDownloadsRepository
    {
        AzureEntities db = new AzureEntities();

        public IEnumerable GetDownloads(int Id)
        {
            var downloads = from sub in db.Submodules
                            join download in db.Downloads
                                on sub.SubmoduleId equals download.SubmoduleId
                            join urlsourcetype in db.UrlSourceTypes
                                on download.UrlSourceTypeId equals urlsourcetype.UrlSourceTypeId
                            join profile in db.Profiles
                                on download.ProfileId equals profile.ProfileId
                            where sub.ModuleId == 6 && profile.ProfileId == Id
                            orderby sub.SubmoduleId descending
                            select new SubmoduleViewModel()
                            {
                                DownloadDescription = download.DownloadDescription,
                                SecurityLevel = sub.SecurityLevel,
                                UrlSourceType = urlsourcetype.UrlSourceTypeDescription,
                                UrlSourceTypeId = urlsourcetype.UrlSourceTypeId,
                                DownloadUrl = download.DownloadUrl,
                                Status = sub.Status
                            };

            return downloads;
        }
    }
}
