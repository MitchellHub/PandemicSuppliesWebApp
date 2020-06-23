using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace PandemicSuppliesWebApp.BL {
    public class BLProductDisplay {
        public static DataTable dtbReturnAllBuyableProducts()
        {
            return DAL.DALProductAccess.dtbSelectActiveAndInStockProducts();
        }
        public static DataTable dtbReturnProductByID(int _intProductID)
        {
            int intProductID = Convert.ToInt32(_intProductID);

            return DAL.DALProductAccess.dtbSelectProducts(intProductID);
        }
    }
}