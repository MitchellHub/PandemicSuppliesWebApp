using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

namespace PandemicSuppliesWebApp.DAL {
    public class User {
        public int UserID { get; set; }
        public string Email { get; set; }
        // string Password { get; set; }
        public string Name { get; set; }
        public bool IsAdmin { get; set; }
        public bool IsActive { get; set; }

        //public string LoginAction { get; set; }    // tells user layer what to do

        // DateTime CreateDate;
    }
}