using Microsoft.VisualStudio.TestTools.UnitTesting;
using Resume.Controllers;
using Resume.Models;
using Resume.Services.Interfaces;
using System.Web.Mvc;

namespace Resume.Tests.Controllers
{
    [TestClass]
    public class HomeControllerTest
    {
        private AzureNavigationEntities db = new AzureNavigationEntities();
        private ICareerHistoryService _ics;

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
            CareerHistoryController controller = new CareerHistoryController(_ics);

            // Act
            ViewResult result = controller.Index(1) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }
    }
}