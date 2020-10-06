using System.Web.Mvc;
using Unity;
using Unity.Mvc5;
using Resume.DAL.Interfaces;
using Resume.DAL.Repositories;
using Resume.Services.Interfaces;
using Resume.Services.Repositories;


namespace Resume
{
    public static class UnityConfig
    {
        public static void RegisterComponents()
        {
			var container = new UnityContainer();
            
            // register all your components with the container here
            // it is NOT necessary to register your controllers
            
            // e.g. container.RegisterType<ITestService, TestService>();
            
            DependencyResolver.SetResolver(new UnityDependencyResolver(container));
            container.RegisterType<ICareerHistoryRepository, CareerHistoryRepository>();
            container.RegisterType<ICareerHistoryService, CareerHistoryService>();
            container.RegisterType<IHomeRepository, HomeRepository>();
            container.RegisterType<IHomeService, HomeService>();
            container.RegisterType<IDownloadsRepository, DownloadsRepository>();
            container.RegisterType<IDownloadsService, DownloadsService>();
        }
    }
}