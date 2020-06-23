using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;

namespace PandemicSuppliesWebApp.BL {
    public class BLAdminAddProduct {
        public static int addProductReturnID(string _strProdName, string _strProdDesc, string _strProductPrice, string _strStockLevel, bool _boolIsActive, byte[] _bytImgArray)
        // method sends product info to lower layer
        {
            // convert input
            try
            {
                string strProdName = _strProdName.ToString();
                string strProdDesc = _strProdDesc.ToString();
                decimal decProductPrice = decimal.Parse(_strProductPrice);
                int intStockLevel = int.Parse(_strStockLevel);
                bool boolIsActive = _boolIsActive;
                byte[] bytImgArray = _bytImgArray;

                // check input
                if (strProdName.Length <= 250 && decProductPrice > 0 && intStockLevel > -1)
                    return DAL.DALProductAccess.addProductToDatabaseReturnID(strProdName, strProdDesc, decProductPrice, intStockLevel, boolIsActive, bytImgArray);
                else
                    return -1;
            }
            catch
            {
                return -1;
            }
        }
    }
}