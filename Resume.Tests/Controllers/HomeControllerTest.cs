using Resume.Controllers;
using Resume.Models;
using Resume.ViewModels;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Web.Mvc;

namespace Resume.Tests.Controllers
{
    [TestClass]
    public class HomeControllerTest
    {
        private AzureNavigationEntities db = new AzureNavigationEntities();

        [TestMethod]
        public void GetHeaderProfile()
        {
            // Arrange
            HomeController controller = new HomeController();

            // Act
            PartialViewResult result = controller.GetHeaderProfile(1) as PartialViewResult;

            // Assert
            Assert.IsNotNull(result);
            Assert.AreEqual("_HeaderProfile", result.ViewName);
        }

        [TestMethod]
        public void Index()
        {
            // Arrange
            CareerHistoryController controller = new CareerHistoryController();

            // Act
            ViewResult result = controller.Index(1) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }
    }
}