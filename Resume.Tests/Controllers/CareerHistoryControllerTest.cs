﻿using Microsoft.VisualStudio.TestTools.UnitTesting;
using Resume.Controllers;
using Resume.Models;
using Resume.Services.Interfaces;
using System.Web.Mvc;



namespace Resume.Tests.Controllers
{
    [TestClass]
    public class CareerHistoryControllerTest
    {
        private AzureNavigationEntities db = new AzureNavigationEntities();
        private ICareerHistoryService _ics;

        [TestMethod]
        public void GetCompany()
        {

            // Arrange
            CareerHistoryController controller = new CareerHistoryController(_ics);

            // Act
            PartialViewResult result = controller.GetCompany(1) as PartialViewResult;

            // Assert
            Assert.IsNotNull(result);
            Assert.AreEqual("_HeaderCareerHistoryCompanies", result.ViewName);
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
