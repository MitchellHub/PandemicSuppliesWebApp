using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PandemicSuppliesWebApp.BL {
    public class User {
        public int UserID { get; set; }
        public string Email { get; set; }
        // string Password { get; set; }
        public string Name { get; set; }
        public bool IsAdmin { get; set; }
        public bool IsActive { get; set; }


        public bool CheckCartHasitems()
        {
            return BLCart.intCartTotalProducts(this.UserID) > 0;
        }

        // DateTime CreateDate;
    }
}