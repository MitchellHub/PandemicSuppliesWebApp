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

        //public static DataTable dtbSelectBillingAddresses(int _intUserID)
        //{
        //    int intUserID = Convert.ToInt32(_intUserID);

        //    return BL.BLAccountAddresses.dtbSelectBillingAddresses(intUserID);
        //}

        //public static DataTable dtbSelectBillingAddress(int _intBillingAddressID)
        //{
        //    int intBillingAddressID = Convert.ToInt32(_intBillingAddressID);

        //    return BL.BLAccountAddresses.dtbSelectBillingAddressb(intBillingAddressID);
        //}

        //public static DataTable dtbSelectMailingAddresses(int _intUserID)
        //{
        //    int intUserID = Convert.ToInt32(_intUserID);

        //    return BL.BLAccountAddresses.dtbSelectMailingAddresses(_intUserID);
        //}

        public static DataRow dtbSelectMailingAddress(int _intMailingAddressID)
        {
            // bounce off AccountAddresses method
            return BL.BLAccountAddresses.dtbSelectMailingAddress(_intMailingAddressID);
        }
    }
}