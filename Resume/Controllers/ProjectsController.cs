using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Resume.Models;
using System.Dynamic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Core.Objects;
using System.Data.SqlClient;
using Resume.ViewModels;
using System.Security.Cryptography.X509Certificates;
using Newtonsoft.Json.Serialization;
using System.Reflection;

namespace Resume.Controllers
{
    public class ProjectsController : Controller
    {
        private AzureNavigationEntities db = new AzureNavigationEntities();

        [ChildActionOnly]
        public PartialViewResult GetCompany(int? id)
        {
            //  !!! Important, this is an exact duplicate of ProjectController/GetCompany
            //      the reason for this is that the shared _ResumeLayout content page action links can only pass 1 controller
            ViewBag.Name = "Randy Clark";

            if (String.IsNullOrEmpty(id.ToString()))
            {
                ViewBag.Id = 0;
            }
            else
            {
                ViewBag.Id = id;
            };
            if(ViewBag.SelectedCompanyId != "" && ViewBag.SelectedCompanyId != null)
            {
                ViewBag.Id = ViewBag.SelectedCompanyId;
            }

            var company =   from co in db.Companies
                                join ch in db.CareerHistories
                                    on co.CompanyId equals ch.CompanyId
                                join ca in db.CareerAccomplishments
                                    on ch.CareerHistoryId equals ca.CareerHistoryId
                            select new CompaniesAndAccomplishmentsViewModel
                            {
                                CompanyId                  = co.CompanyId,	
                                CompanyName                = co.CompanyName,
                                Address1                   = co.Address1,
                                Address2                   = co.Address2,
                                Address3                   = co.Address3,
                                StateInitials              = co.StateInitials,
                                City                       = co.City,
                                ZipCode                    = co.ZipCode,
                                ZipCodeSuffix              = co.ZipCodeSuffix,
                                PhoneNumber                = co.PhoneNumber,
                                AccomplishmentId           = ca.AccomplishmentId,
                                AccomplishmentDescription  = ca.AccomplishmentDescription,
                                CareerHistoryId            = ca.CareerHistoryId
                            };
            
            return PartialView("_HeaderCompanies", company);
        }
        // GET: Projects
        public ActionResult Index(string id = null, string LastSelectedController = null, string LastSelectedAction = null, string LastSelectedParam = null, string LastSelectedProjectId = null)
        {
            ViewBag.LastSelectedController = LastSelectedController;// these ViewBags indicate menuu/submenu/param selected
            ViewBag.LastSelectedAction = LastSelectedAction;
            ViewBag.LastSelectedParam = LastSelectedParam;
            ViewBag.LastSelectedProjectId = LastSelectedProjectId;

            if (LastSelectedParam != null)
            {
                id = LastSelectedParam;// this is to filter the actual page contents
            }
            ViewBag.SelectedCompanyId = id;

            Object project = new Object();
            project =   from pro in db.Projects
                        where (id == null || pro.CompanyId.ToString() == id)
                        select pro;

            return View(project);
        }
        [HttpPost]
        public ActionResult GetControllerAction(UrlSelectionViewModel url)
        {
            return RedirectToAction("Index", "Projects", new {id = url.Param.ToString(),
                                                              LastSelectedController = url.Controller,
                                                              LastSelectedAction = url.Action,
                                                              LastSelectedParam = url.Param.ToString(),
                                                              LastSelectedProjectId = url.ProjectId.ToString()
            });
        }
    }
}