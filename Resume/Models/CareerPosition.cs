//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Resume.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class CareerPosition
    {
        public int CareerPositionId { get; set; }
        public int CareerHistoryId { get; set; }
        public string WorkTitle { get; set; }
        public string RoleHeader { get; set; }
        public string WorkDescription { get; set; }
    
        public virtual CareerHistory CareerHistory { get; set; }
    }
}
