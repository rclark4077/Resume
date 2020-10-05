using Microsoft.VisualStudio.TestTools.UnitTesting;
using Resume.Controllers;
using Resume.Models;
using Resume.ViewModels;
using System.Web.Mvc;

namespace Resume.Tests.Controllers
{
    [TestClass]
    public class ProjectsControllerTest
    {
        private AzureNavigationEntities db = new AzureNavigationEntities();

        [TestMethod]
        public void GetCompany()
        {
            // Arrange
            ProjectsController controller = new ProjectsController();

            // Act
            PartialViewResult result = controller.GetCompany(1) as PartialViewResult;

            // Assert
            Assert.IsNotNull(result);
            Assert.AreEqual("_HeaderCompanies", result.ViewName);
        }

        [TestMethod]
        public void Index()
        {
            // Arrange
            ProjectsController controller = new ProjectsController();

            // Act
            ViewResult result = controller.Index("1") as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }


        [TestMethod]
        public void GetControllerAction()
        {
            // Arrange
            var controller = new ProjectsController();

            // Act
            UrlSelectionViewModel url = new UrlSelectionViewModel()
            {
                Controller = "ProjectsController",
                Action = "Index",
                Param = 1,
                ProjectId = 1
            };
            var result = (RedirectToRouteResult)controller.GetControllerAction(url);

            // Assert
            Assert.AreEqual("Index", result.RouteValues["action"]);
        }
    }
}