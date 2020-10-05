using Microsoft.VisualStudio.TestTools.UnitTesting;
using Resume.Controllers;
using Resume.Models;
using System.Web.Mvc;

namespace Resume.Tests.Controllers
{
    [TestClass]
    public class QualificationsControllerTest
    {
        private AzureNavigationEntities db = new AzureNavigationEntities();

        [TestMethod]
        public void GetQualificationTypes()
        {
            // Arrange
            QualificationsController controller = new QualificationsController();

            // Act
            PartialViewResult result = controller.GetQualificationTypes(1) as PartialViewResult;

            // Assert
            Assert.IsNotNull(result);
            Assert.AreEqual("_HeaderQualifications", result.ViewName);
        }

        [TestMethod]
        public void Index()
        {
            // Arrange
            QualificationsController controller = new QualificationsController();

            // Act
            ViewResult result = controller.Index(1) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }
    }
}