using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace PandemicSuppliesWebApp.BL {
    public class BLAdminAccounts {
        public static DataTable dtbAccounts(string _strSearchID)
            // method returns a data table from data access layer
        {
            // check strings aren't too long
            int intSearchID = Convert.ToInt32(_strSearchID);

            return DAL.DALUserAccess.dtbNonAdminUsers(intSearchID);
        }
    }
}