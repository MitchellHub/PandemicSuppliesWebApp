using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace PandemicSuppliesWebApp.BL {
    public class BLAccountSettings {
        public static DataTable dtbSelectUserInfo(int _intUserID)
        {
            DataTable dtbReturnValue = new DataTable();

            try
            {
                int intUserID = Convert.ToInt32(_intUserID);
                dtbReturnValue = DAL.DALUserAccess.dtbSelectUserByID(_intUserID);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.ToString());
                throw new BusinessLayerException();
            }
            return dtbReturnValue;
        }

        public static void updateName(string _strNewName, int _intUserID)
        {
            try
            {
                string strNewName = _strNewName.ToString();
                int intUserID = Convert.ToInt32(_intUserID);
                DAL.DALUserAccess.updateUserName(strNewName, intUserID);
            }
            catch
            {
                throw new BusinessLayerException();
            }
        }
    }
}