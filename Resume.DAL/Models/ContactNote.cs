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
    
    public partial class ContactNote
    {
        public int ContactNoteId { get; set; }
        public int ProfileId { get; set; }
        public int NoteTypeId { get; set; }
        public string Note { get; set; }
    
        public virtual NoteType NoteType { get; set; }
        public virtual Profile Profile { get; set; }
    }
}
