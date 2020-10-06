using System.Collections;
using System.Linq;
using Resume.DAL.Models;
using Resume.ViewModels;
using Resume.DAL.Interfaces;

namespace Resume.DAL.Repositories
{
    public class DownloadsRepository : IDownloadsRepository
    {
        AzureEntities db = new AzureEntities();
        public IEnumerable GetDownloads()
        {
            var downloads = from sub in db.Submodules
                            join download in db.Downloads
                                on sub.SubmoduleId equals download.SubmoduleId
                            join urlsourcetype in db.UrlSourceTypes
                                on download.UrlSourceTypeId equals urlsourcetype.UrlSourceTypeId
                            where sub.ModuleId == 6
                            orderby sub.SubmoduleId descending
                            select new SubmoduleViewModel()
                            {
                                SubmoduleDescription = sub.SubmoduleDescription,
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
