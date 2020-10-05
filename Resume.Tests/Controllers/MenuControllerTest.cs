using Resume.Controllers;
using Resume.Models;
using Resume.ViewModels;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Web;
using System.Web.Mvc;
using System.Dynamic;

namespace Resume.Tests.Controllers
{
    [TestClass]
    public class MenuControllerTest
    {
        private AzureNavigationEntities db = new AzureNavigationEntities();

        [TestMethod]
        public void BuildNavigation()
        {
            
            // Arrange
            MenuController controller = new MenuController();

            // Act
            PartialViewResult result = controller.BuildNavigation() as PartialViewResult;

            // Assert
            Assert.AreEqual("_BuildNavigation", result.ViewName);
        }

        [TestMethod]
        public void Index()
        {
            // Arrange
            var controller = new MenuController();

            // Act
            var result = (RedirectToRouteResult) controller.Index();

            // Assert
            Assert.AreEqual("Index", result.RouteValues["action"]);
        }
    }
}
