using Microsoft.VisualStudio.TestTools.UnitTesting;
using Resume.Controllers;
using Resume.Models;
using System.Web.Mvc;

namespace Resume.Tests.Controllers
{
    [TestClass]
    public class EducationControllerTest
    {
        private AzureNavigationEntities db = new AzureNavigationEntities();

        [TestMethod]
        public void GetEducation()
        {
            // Arrange
            EducationController controller = new EducationController();

            // Act
            PartialViewResult result = controller.GetEducation(1) as PartialViewResult;

            // Assert
            Assert.IsNotNull(result);
            Assert.AreEqual("_HeaderEducation", result.ViewName);
        }
    }
}
