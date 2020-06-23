using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace PandemicSuppliesWebApp.BL {
    public class BLAccountAddresses {
        public static void insertBillingAddress(int _intUserID, bool _boolIsDefault, string _strName, int _intUnitNo, 
            int _intStreetNo, string _strStreet, string _strSuburb, int _intPostCode, string _strState, int _intPhone)
        {
            int intUserID = Convert.ToInt32(_intUserID);
            bool boolIsDefault = Convert.ToBoolean(_boolIsDefault);
            string strName = _strName.ToString();
            int intUnitNo = Convert.ToInt32(_intUnitNo);
            int intStreetNo = Convert.ToInt32(_intStreetNo);
            string strStreet = _strStreet.ToString();
            string strSuburb = _strSuburb.ToString();
            int intPostCode = Convert.ToInt32(_intPostCode);
            string strState = _strState.ToString();
            int intPhone = Convert.ToInt32(_intPhone);

            // set other addresses IsDefault = false if this address is destined to be the default address
            if (boolIsDefault)
                DAL.DALBillingAddressAccess.updateBillingAddressDefaults(intUserID);

            DAL.DALBillingAddressAccess.InsertBillingAddress(
                intUserID,
                boolIsDefault,
                strName, intUnitNo,
                intStreetNo,
                strStreet,
                strSuburb,
                intPostCode,
                strState,
                intPhone);
        }
        public static DataTable dtbSelectBillingAddresses(int _intUserID)
        {
            int intUserID = Convert.ToInt32(_intUserID);

            return DAL.DALBillingAddressAccess.dtbSelectBillingAddresses(intUserID);
        }

        public static void deactivateBillingAddress(int _intAddressID)
        {
            int intAddressID = Convert.ToInt32(_intAddressID);

            DAL.DALBillingAddressAccess.updateBillingAddressIsActive(intAddressID, false);
        }

        public static void setDefaultBillingAddress(int _intUserID, int _intAddressID)
        {
            int intUserID = Convert.ToInt32(_intUserID);
            int intAddressID = Convert.ToInt32(_intAddressID);

            DAL.DALBillingAddressAccess.updateBillingAddressDefaults(intUserID);
            DAL.DALBillingAddressAccess.updateBillingAddressIsDefault(intAddressID);
        }

        public static void insertMailingAddress(int _intUserID, bool _boolIsDefault, string _strName, int _intUnitNo,
            int _intStreetNo, string _strStreet, string _strSuburb, int _intPostCode, string _strState, int _intPhone)
        {

        }
    }
}