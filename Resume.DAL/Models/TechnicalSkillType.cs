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
    
    public partial class TechnicalSkillType
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TechnicalSkillType()
        {
            this.TechnicalSkills = new HashSet<TechnicalSkill>();
        }
    
        public int TechnicalSkillTypeId { get; set; }
        public string TechnicalSkillTypeDescription { get; set; }
        public int SortOrder { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TechnicalSkill> TechnicalSkills { get; set; }
    }
}
