using System.Collections;
using System.Linq;
using Resume.DAL.Interfaces;
using Resume.DAL.Models;
using Resume.ViewModel;

namespace Resume.DAL.Repositories
{
    public class CareerHistoryRepository : ICareerHistoryRepository
    {
        AzureEntities db = new AzureEntities();

        public IEnumerable GetCompany(int id = 1)
        {
            var company = from co in db.Companies
                            join ch in db.CareerHistories
                                on co.CompanyId equals ch.CompanyId
                            join ca in db.CareerAccomplishments
                                on ch.CareerHistoryId equals ca.CareerHistoryId
                            orderby ch.StartDate descending
                            select new AccomplishmentsViewModel
                            {
                                CompanyId = co.CompanyId,
                                CompanyName = co.CompanyName,
                                Address1 = co.Address1,
                                Address2 = co.Address2,
                                Address3 = co.Address3,
                                StateInitials = co.StateInitials,
                                City = co.City,
                                ZipCode = co.ZipCode,
                                ZipCodeSuffix = co.ZipCodeSuffix,
                                PhoneNumber = co.PhoneNumber,
                                AccomplishmentId = ca.AccomplishmentId,
                                AccomplishmentDescription = ca.AccomplishmentDescription,
                                CareerHistoryId = ca.CareerHistoryId,
                                StartDate = ch.StartDate,
                                EndDate = ch.EndDate
                            };
            return company;
        }

        public IEnumerable Index(int id = 1)
        {
            var careerposition = from profile in db.Profiles
                                 join career in db.CareerHistories
                                     on profile.ProfileId equals career.ProfileId
                                 join company in db.Companies
                                     on career.CompanyId equals company.CompanyId
                                 join position in db.CareerPositions
                                     on career.CareerHistoryId equals position.CareerHistoryId
                                 where company.CompanyId == id
                                 orderby career.StartDate descending
                                 select new CareerHistoryViewModel
                                 {
                                     CompanyId = company.CompanyId,
                                     ProfileId = career.ProfileId,
                                     CareerHistoryId = career.CareerHistoryId,
                                     CareerPositionId = position.CareerPositionId,
                                     CompanyName = company.CompanyName,
                                     RoleHeader = position.RoleHeader,
                                     WorkTitle = position.WorkTitle,
                                     WorkDescription = position.WorkDescription
                                 };

            return careerposition;
        }
    }
}
