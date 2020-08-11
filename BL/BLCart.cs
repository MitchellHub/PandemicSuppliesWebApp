using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace PandemicSuppliesWebApp.BL {
    public class BLCart {
        public static void addProductToCart(int _intUserID, int _intProductID, int _intAmount)
        {
            try
            {
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
                    // this does not work as expexted. the cart will still be created, but the item will not be inserted
                    // the addedToCart page also displays the wrong item
                    System.Diagnostics.Debug.WriteLine("False");
                    DAL.DALCartAccess.insertCart(intUserID);
                    addProductToCart(intUserID, intProductID, intAmount);
                }
            }
            catch
            {
                throw new BusinessLayerException();
            }
            
        }

        public static int intSelectCartID(int _intUserID)
        {
            try
            {
                int intUserID = Convert.ToInt32(_intUserID);
                return DAL.DALCartAccess.selectCartIDByUserID(intUserID);
            }
            catch
            {
                throw new BusinessLayerException();
            }
        }

        public static void removeProductFromCart(int _intUserID, int _intProductID)
            // method should only be called if cart exists
        {
            try
            {
                int intUserID = Convert.ToInt32(_intUserID);
                int intProductID = Convert.ToInt32(_intProductID);

                DAL.DALCartAccess.insertProductIntoCart(
                    DAL.DALCartAccess.selectCartIDByUserID(intUserID),
                    intProductID, 0);
            }
            catch
            {
                throw new BusinessLayerException();
            }
        }

        public static DataTable dtbSelectAllCartProducts(int _intUserID)
        {
            try
            {
                int intUserID = Convert.ToInt32(_intUserID);

                // call dtbSelectAllCartProducts with selectCartIDByUserID to retrieve cartID
                return DAL.DALCartAccess.dtbSelectAllCartProductsInfo(
                    DAL.DALCartAccess.selectCartIDByUserID(_intUserID));
            }
            catch
            {
                throw new BusinessLayerException();
            }
        }

        public static int intCartTotalProducts(int _intUserID)
            // returns total number of products in a cart
        {
            try
            {
                int intUserID = Convert.ToInt32(_intUserID);
                // call intSumTotalProducts with selectCardIDByUserID to retrieve the cartID
                return DAL.DALCartAccess.intSumTotalProducts(
                    DAL.DALCartAccess.selectCartIDByUserID(intUserID));
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.ToString());
                throw new BusinessLayerException();
            }
        }

        public static decimal decCartTotalPrice(int _intUserID)
            // returns total price of products in cart
        {
            try
            {
                int intUserID = Convert.ToInt32(_intUserID);
                // call decSumTotalPrice with selectCardIDByUserID to retrieve the cartID
                return DAL.DALCartAccess.decSumTotalPrice(
                    DAL.DALCartAccess.selectCartIDByUserID(_intUserID));
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.ToString());
                throw new BusinessLayerException();
            }
        }
        public static int intSingularProductQuantityFromCart(int _intUserID, int _intProductID)
        {
            try
            {
                int intUserID = Convert.ToInt32(_intUserID);
                int intProductID = Convert.ToInt32(_intProductID);

                return DAL.DALCartAccess.intSelectProductQuantityFromCart(
                    DAL.DALCartAccess.selectCartIDByUserID(intUserID),
                    intProductID);
            }
            catch
            {
                throw new BusinessLayerException();
            }
        }
    }
}