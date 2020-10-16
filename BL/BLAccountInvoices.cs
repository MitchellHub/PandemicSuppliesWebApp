using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace PandemicSuppliesWebApp.BL {
    public class BLAccountInvoices {
        public static DataTable dtbSelectInvoices(int _intUserID)
        {
            int intUserID = Convert.ToInt32(_intUserID);

            return DAL.DALInvoices.dtbSelectInvoices(intUserID);
        }

        public static DataTable dtbSelectBillingAddresses(int _intUserID)
        {
            int intUserID = Convert.ToInt32(_intUserID);

            return BL.BLAccountAddresses.dtbSelectBillingAddresses(_intUserID);
        }

        public static DataTable dtbSelectMailingAddresses(int _intUserID)
        {
            int intUserID = Convert.ToInt32(_intUserID);

            return BL.BLAccountAddresses.dtbSelectMailingAddresses(_intUserID);
        }
    }
}