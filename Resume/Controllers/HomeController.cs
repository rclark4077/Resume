using System.Data;
using System.Dynamic;
using System.Linq;
using System.Web.Mvc;
using Resume.Models;
using Resume.ViewModels;


namespace Resume.Controllers
{
    public class HomeController : Controller
    {
        private AzureNavigationEntities db = new AzureNavigationEntities();

        [ChildActionOnly]
        public PartialViewResult GetHeaderProfile(int? id)
        {
            ViewBag.Name = "Randy Clark";
            ViewBag.Controller = "Home";

            var Profiles =              from Profile in db.Profiles
                                        where (id.ToString() == null || Profile.ProfileId == id)
                                        select Profile;

            var ProfileAttributes =     from ProfileAttribute in db.ProfileAttributes
                                        where (id.ToString() == null || ProfileAttribute.ProfileId == id)
                                        select ProfileAttribute;


            var SocialNetworkProfiles = from sp in db.SocialNetworkProfiles
                                        join sn in db.SocialNetworks
                                            on sp.SocialNetworkId equals sn.SocialNetworkId
                                        join st in db.SocialNetworkTypes
                                            on sn.SocialNetworkTypeId equals st.SocialNetworkTypeId
                                        where (id.ToString() == null || sp.ProfileId == id)
                                        select new SocialNetworksViewModel()
                                        {
                                            SocialNetworkDescription = st.SocialNetworkDescription,
                                            SocialNetworkAddress = sn.SocialNetworkAddress
                                        };

            var ContactNotes =          from ContactNote in db.ContactNotes
                                        where (id.ToString() == null || ContactNote.ProfileId == id)
                                        select ContactNote;


            dynamic model = new ExpandoObject();
            model.Profiles = Profiles;
            model.ProfileAttributes = ProfileAttributes;
            model.SocialNetworkProfiles = SocialNetworkProfiles;
            model.ContactNotes = ContactNotes;

            return PartialView("_HeaderProfile", model);
        }
        // GET: Home
        public ActionResult Index(int? id)
        {
            if (id == null)
            {
                id = 1;
            }
            return View();
        }
    }
}