using Resume.DAL.Interfaces;
using Resume.DAL.Models;
using Resume.ViewModel;
using System.Collections;
using System.Dynamic;
using System.Linq;

namespace Resume.DAL.Repositories
{
    public class HomeRepository : IHomeRepository
    {
        AzureEntities db = new AzureEntities();

        public IEnumerable GetSocialNetworks(int id)
        {
            var SocialNetworkProfiles = from sp in db.SocialNetworkProfiles
                                        join sn in db.SocialNetworks
                                            on sp.SocialNetworkId equals sn.SocialNetworkId
                                        join st in db.SocialNetworkTypes
                                            on sn.SocialNetworkTypeId equals st.SocialNetworkTypeId
                                        where sp.ProfileId == id && sp.SocialProfileStatus == 1//Active
                                        select new SocialNetworksViewModel()
                                        {
                                            SocialNetworkDescription = st.SocialNetworkDescription,
                                            SocialNetworkAddress = sn.SocialNetworkAddress,
                                            SocialProfileStatus = sp.SocialProfileStatus
                                        };

            return (SocialNetworkProfiles);
        }

        public dynamic GetHeaderProfile(int id)
        {
            var Profiles = from Profile in db.Profiles
                           where Profile.ProfileId == id
                           select Profile;

            var ProfileAttributes = from ProfileAttribute in db.ProfileAttributes
                                    where ProfileAttribute.ProfileId == id
                                    select ProfileAttribute;


            var SocialNetworkProfiles = from sp in db.SocialNetworkProfiles
                                        join sn in db.SocialNetworks
                                            on sp.SocialNetworkId equals sn.SocialNetworkId
                                        join st in db.SocialNetworkTypes
                                            on sn.SocialNetworkTypeId equals st.SocialNetworkTypeId
                                        where sp.ProfileId == id && sp.SocialProfileStatus == 1//Active
                                        select new SocialNetworksViewModel()
                                        {
                                            SocialNetworkDescription = st.SocialNetworkDescription,
                                            SocialNetworkAddress = sn.SocialNetworkAddress,
                                            SocialProfileStatus = sp.SocialProfileStatus
                                        };

            var ContactNotes = from ContactNote in db.ContactNotes
                               where ContactNote.ProfileId == id
                               select ContactNote;

            dynamic model = new ExpandoObject();
            model.Profiles = Profiles;
            model.ProfileAttributes = ProfileAttributes;
            model.SocialNetworkProfiles = SocialNetworkProfiles;
            model.ContactNotes = ContactNotes;

            return model;
        }
    }
}
