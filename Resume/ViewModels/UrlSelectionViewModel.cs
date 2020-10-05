using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Resume.ViewModels
{
    public class UrlSelectionViewModel
    {
        public string Controller { get; set; }
        public string Action { get; set; }
        public int Param { get; set; }
        public int ProjectId { get; set; }
    }
}