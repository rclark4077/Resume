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
    
    public partial class ProfileAttribute
    {
        public int ProfileAttributeId { get; set; }
        public string ProfileAttributeDescription { get; set; }
        public int ProfileId { get; set; }
    
        public virtual Profile Profile { get; set; }
    }
}
