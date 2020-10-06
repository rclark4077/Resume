using System.ComponentModel.DataAnnotations;

namespace Resume.ViewModels
{
    public class CareerHistoryViewModel
    {
        public int CompanyId { get; set; }
        public int ProfileId { get; set; }
        public int CareerHistoryId { get; set; }
        public int CareerPositionId { get; set; }

        [Display(Name = "Company Name")]
        public string CompanyName { get; set; }

        [Display(Name = "Role Served")]
        public string RoleHeader { get; set; }

        [Display(Name = "Role Summary")]
        public string WorkTitle { get; set; }

        [Display(Name = "Description")]
        public string WorkDescription { get; set; }
    }
}