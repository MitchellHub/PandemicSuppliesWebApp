using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;

namespace PandemicSuppliesWebApp.BL {
    public class BLAdminAddProduct {
        public static int addProductReturnID(string _strProdName, string _strProdDesc, string _strProductPrice, string _strStockLevel, bool _boolIsActive, string _strImgSource)
            // method sends product info to lower layer
        {
            // convert input
            string strProdName = _strProdName.ToString();
            string strProdDesc = _strProdDesc.ToString();
            decimal fltProductPrice = decimal.Parse(_strProductPrice);
            int intStockLevel = int.Parse(_strStockLevel);
            bool boolIsActive = _boolIsActive;
            string imgSource = _strImgSource;

            // check input
            if (strProdName.Length <= 250 && fltProductPrice > 0 && intStockLevel > -1)
                return DAL.DALProductAccess.addProductToDatabaseReturnID(strProdName, strProdDesc, fltProductPrice, intStockLevel, boolIsActive, imgSource);
            else
                return -1;
        }
    }
}