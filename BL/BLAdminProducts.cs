using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace PandemicSuppliesWebApp.BL {
    public class BLAdminProducts {
        public static DataTable dtbReturnProducts(string _strSearchID)
            // method returns a datatable from data access layer
        {
            // convert to int
            int intSearchID = Convert.ToInt32(_strSearchID);

            return DAL.DALProductAccess.dtbReturnProducts(intSearchID);
        }

        public static void updateProductData(string _strProductID, string _strProductName, string _strProductDesc, string _strProductPrice, string _strStockLevel, string _strImgSource, bool _boolIsActive)
            // method sends product data to lower level
        {
            int intProductID = int.Parse(_strProductID);
            string strProductName = _strProductName.ToString();
            string strProductDesc = _strProductDesc.ToString();
            decimal decProductPrice = decimal.Parse(_strProductPrice);
            int intStockLevel = int.Parse(_strStockLevel);
            string strImgSource = _strImgSource.ToString();
            bool boolIsActive = (bool) _boolIsActive;

            DAL.DALProductAccess.updateProductDataInDatabase(intProductID, strProductName, strProductDesc, decProductPrice, intStockLevel, strImgSource, boolIsActive);
        }
    }
}