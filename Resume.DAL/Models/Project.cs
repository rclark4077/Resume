//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Resume.DAL.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Project
    {
        public int ProjectId { get; set; }
        public int ProjectTypeId { get; set; }
        public int ProfileId { get; set; }
        public int CompanyId { get; set; }
        public string ProjectTitle { get; set; }
        public string ProjectDescription { get; set; }
    
        public virtual Company Company { get; set; }
        public virtual Profile Profile { get; set; }
        public virtual ProjectType ProjectType { get; set; }
    }
}
