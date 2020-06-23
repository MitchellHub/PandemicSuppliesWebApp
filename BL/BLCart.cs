using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace PandemicSuppliesWebApp.BL {
    public class BLCart {
        public static void addProductToCart(int _intUserID, int _intProductID, int _intAmount)
        {
            System.Diagnostics.Debug.WriteLine(_intUserID.ToString());
            System.Diagnostics.Debug.WriteLine("addProductToCart");

            int intUserID = Convert.ToInt32(_intUserID);
            int intProductID = Convert.ToInt32(_intProductID);
            int intAmount = Convert.ToInt32(_intAmount);

            // if cart exists, insert products
            if (DAL.DALCartAccess.boolCheckCartExists(intUserID))
            {
                System.Diagnostics.Debug.WriteLine("True");
                DAL.DALCartAccess.insertProductIntoCart(
                    DAL.DALCartAccess.selectCartIDByUserID(intUserID),
                    intProductID, intAmount);
            }   // else create cart and call method again
            else
            {
                System.Diagnostics.Debug.WriteLine("False");
                DAL.DALCartAccess.insertCart(intUserID);
                addProductToCart(intUserID, intProductID, intAmount);
            }
        }

        public static void removeProductFromCart(int _intUserID, int _intProductID)
            // method should only be called if cart exists
        {
            int intUserID = Convert.ToInt32(_intUserID);
            int intProductID = Convert.ToInt32(_intProductID);

            DAL.DALCartAccess.insertProductIntoCart(
                DAL.DALCartAccess.selectCartIDByUserID(intUserID),
                intProductID, 0);
        }

        public static DataTable dtbSelectAllCartProducts(int _intUserID)
        {
            int intUserID = Convert.ToInt32(_intUserID);

            // call dtbSelectAllCartProducts with selectCartIDByUserID to retrieve cartID
            return DAL.DALCartAccess.dtbSelectAllCartProductsInfo(
                DAL.DALCartAccess.selectCartIDByUserID(_intUserID));
        }

        public static int intCartTotalProducts(int _intUserID)
            // returns total number of products in a cart
        {
            int intTotalProducts = -1;
            try
            {
                int intUserID = Convert.ToInt32(_intUserID);
                // call intSumTotalProducts with selectCardIDByUserID to retrieve the cartID
                return intTotalProducts = DAL.DALCartAccess.intSumTotalProducts(
                    DAL.DALCartAccess.selectCartIDByUserID(intUserID));
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("BL error");
                System.Diagnostics.Debug.WriteLine(ex.ToString());
            }
            return intTotalProducts;
        }

        public static decimal decCartTotalPrice(int _intUserID)
            // returns total price of products in cart
        {
            decimal decTotalPrice = 0.00m;
            try
            {
                int intUserID = Convert.ToInt32(_intUserID);
                // call decSumTotalPrice with selectCardIDByUserID to retrieve the cartID
                decTotalPrice = DAL.DALCartAccess.decSumTotalPrice(
                    DAL.DALCartAccess.selectCartIDByUserID(_intUserID));
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("BL error");
                System.Diagnostics.Debug.WriteLine(ex.ToString());
            }
            return decTotalPrice;
        }
        public static int intSingularProductQuantityFromCart(int _intUserID, int _intProductID)
        {
            int intUserID = Convert.ToInt32(_intUserID);
            int intProductID = Convert.ToInt32(_intProductID);

            return DAL.DALCartAccess.intSelectProductQuantityFromCart(
                DAL.DALCartAccess.selectCartIDByUserID(intUserID), 
                intProductID);
        }
    }
}