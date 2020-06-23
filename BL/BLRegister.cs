using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PandemicSuppliesWebApp.BL {
    public class BLRegister {
        public static int intRegisterUser(string _strEmail, string _strName, string _strPassword)
        {
            // check string length
            string strEmail = _strEmail.ToString();
            string strName = _strName.ToString();
            string strPassword = _strPassword.ToString();

            return DAL.DALRegister.intRegisterNonAdminUser(strEmail, strName, strPassword);
        }
    }
}