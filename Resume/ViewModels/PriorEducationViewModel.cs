using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Resume.ViewModels
{
    public class PriorEducationViewModel
    {
        public int ProfileId                    { get; set; }
        public int InstitutionId                { get; set; }
        public string InstitutionDescription    { get; set; }
        public string Major                     { get; set; }
        public string Curriculum                { get; set; }
        public string Degree                    { get; set; }
        public string GraduationDate            { get; set; }
    }
}