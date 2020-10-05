using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Resume.ViewModels
{
    public class QualificationViewModel
    {
        public int      TechnicalSkillTypeId            { get; set; }
        public string   TechnicalSkillTypeDescription   { get; set; }
        public string   TechnicalSkillDescription       { get; set; }
    }
}