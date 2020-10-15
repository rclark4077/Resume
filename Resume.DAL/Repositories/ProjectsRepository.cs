using System.Collections;
using System.Linq;
using System.Web.Mvc;
using Resume.DAL.Interfaces;
using Resume.DAL.Models;
using Resume.ViewModel;


namespace Resume.DAL.Repositories
{
    public class ProjectsRepository : IProjectsRepository
    {
        AzureEntities db = new AzureEntities();

        public IEnumerable GetCompany(int id)
        {
            var company = from co in db.Companies
                          join ch in db.CareerHistories
                              on co.CompanyId equals ch.CompanyId
                          join ca in db.CareerAccomplishments
                              on ch.CareerHistoryId equals ca.CareerHistoryId
                          select new CompaniesAndAccomplishmentsViewModel
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
                              CareerHistoryId = ca.CareerHistoryId
                          };

            return company;
        }

        public IEnumerable Index(string id
                                , string LastSelectedController = null
                                , string LastSelectedAction = null
                                , string LastSelectedParam = null
                                , string LastSelectedProjectId = null)
        {
            var project = from pro in db.Projects
                          where (id == null || pro.CompanyId.ToString() == id)
                          select pro;

            return project;
        }
    }
}
