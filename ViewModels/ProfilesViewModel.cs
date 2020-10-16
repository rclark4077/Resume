using System;

namespace ViewModel
{
    public class ProfilesViewModel
    {
        public int ProfileId { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Address3 { get; set; }
        public string City { get; set; }
        public string StateInitials { get; set; }
        public int ZipCode { get; set; }
        public Nullable<int> ZipCodeSuffix { get; set; }
        public string PhoneNumber { get; set; }
        public bool IsSelf { get; set; }
    }
}
