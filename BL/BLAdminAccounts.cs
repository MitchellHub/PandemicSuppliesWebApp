using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace PandemicSuppliesWebApp.BL {
    public class BLAdminAccounts {
        public static DataTable dtbAccounts(string _strUserID)
            // method returns a data table from data access layer
        {
            // check strings aren't too long
            int intUserID = Convert.ToInt32(_strUserID);

            return DAL.DALUserAccess.dtbNonAdminUsers(intUserID);
        }

        public static void setUserIsActiveStatus(string _strUserID, bool _boolIsActive)
            // method sends a userID with an IsActive boolean status to set to
        {
            int intUserID = int.Parse(_strUserID);
            bool boolIsActive = _boolIsActive;

            DAL.DALUserAccess.updateUserIsActiveStatusInDatabase(intUserID, boolIsActive);
        }

        public static DataTable dtbInvoices(int _intUserID)
        {
            int intUserID = _intUserID;
            return DAL.DALInvoices.dtbSelectInvoices(intUserID);
        }
    }
}