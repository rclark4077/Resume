using System;
using System.ComponentModel.DataAnnotations;

namespace Resume.ViewModels
{
    public class AccomplishmentsViewModel
    {
        public int CompanyId { get; set; }

        [Display(Name = "Company Name")]
        public string CompanyName { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Address3 { get; set; }

        [Display(Name = "State Initials")]
        public string StateInitials { get; set; }
        public string City { get; set; }

        [Display(Name = "Zip Code")]
        public Nullable<int> ZipCode { get; set; }
        public Nullable<int> ZipCodeSuffix { get; set; }

        [Display(Name = "Phone Number")]
        public string PhoneNumber { get; set; }
        public int AccomplishmentId { get; set; }
        public string AccomplishmentDescription { get; set; }
        public int CareerHistoryId { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
    }
}