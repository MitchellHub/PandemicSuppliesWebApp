using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PandemicSuppliesWebApp.BL {
    public class BLLogin {
        public static BL.User usrLoginUser(string _strEmail, string _strPassword)
        {
            // check string length
            string strEm = _strEmail.ToString();
            string strPwd = _strPassword.ToString();

            return DAL.DALLogin.usrLoginUser(strEm, strPwd); // pass down login credentials, return logged in user
        }
    }
}