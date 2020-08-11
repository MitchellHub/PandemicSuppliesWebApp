using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace PandemicSuppliesWebApp.BL {
    public class BLCheckout {
        public static bool boolCheckStockLevelsAndReduceStockLevels(int _intUserID)
        {
            // equals false if a stock level is lower than the cart purchase request
            // starts at true, then turns to false if stock level is lower than request 
            bool boolReturnValue = true;
            try
            {
                int intUserID = Convert.ToInt32(_intUserID);
                int intCartID = DAL.DALCartAccess.selectCartIDByUserID(_intUserID);

                DataTable dtbCartProducts = DAL.DALCartAccess.dtbSelectAllCartProductsInfo(intCartID);

                foreach (DataRow drw in dtbCartProducts.Rows)
                {
                    int intProductID = (int)drw["ProductID"];
                    int intProductRealStockLevel = (int)drw["StockLevel"];
                    System.Diagnostics.Debug.WriteLine(intProductRealStockLevel);
                    // get product quantity from cart
                    int intCartStockLevel = (int)DAL.DALCartAccess.intSelectProductQuantityFromCart(intCartID, intProductID);
                    
                    // if the requested amount exceeds stock level
                    if (intCartStockLevel > intProductRealStockLevel)
                    {
                        boolReturnValue = false;
                        break;
                    }
                }
                // check if ret value was set to false, if so - return false
                if (!boolReturnValue)
                    return false;
                else
                {
                    // else reduce the stock levels
                    foreach (DataRow drw in dtbCartProducts.Rows)
                    {
                        int intProductID = (int)drw["ProductID"];
                        System.Diagnostics.Debug.WriteLine(intProductID);
                        int intCartStockLevel = (int)DAL.DALCartAccess.intSelectProductQuantityFromCart(intCartID, intProductID);
                        // convert to negative
                        intCartStockLevel *= -1;
                        // update stock levels
                        DAL.DALProductAccess.updateProductStockLevelByAddition(intProductID, intCartStockLevel);
                    }
                    return true;
                }
            }
            catch
            {
                throw new BusinessLayerException();
            }
        }

        public static int intMakePurchaseReturnID(int _intBillingAddressID, int _intMailingAddressID, decimal _decInvoiceTotal, decimal _decPostageCost, int _intUserID)
        {
            try
            {
                // variables
                int intInvoiceID;
                int intBillingAddressID = Convert.ToInt32(_intBillingAddressID);
                int intMailingAddressID = Convert.ToInt32(_intMailingAddressID);
                decimal decInvoiceTotal = _decInvoiceTotal;
                decimal decPostageTotal = _decPostageCost;
                int intUserID = Convert.ToInt32(_intUserID);
                int intCartID = DAL.DALCartAccess.selectCartIDByUserID(intUserID);

                // insert order, grab ID
                intInvoiceID = DAL.DALInvoices.intInsertOrderReturnID(intBillingAddressID, intMailingAddressID, intUserID, decInvoiceTotal, decPostageTotal);
                // grab data table for cart
                DataTable dtbCart = DAL.DALCartAccess.dtbSelectAllCartProductsInfo(intCartID);

                // loop and insert Invoices_Products entries for each product in cart
                foreach (DataRow drw in dtbCart.Rows)
                {
                    int intProductID = (int)drw["ProductID"];
                    decimal decProductSellPrice = (decimal)drw["ProductPrice"];

                    int intProductQuantity = (int)DAL.DALCartAccess.intSelectProductQuantityFromCart(intCartID, intProductID);

                    System.Diagnostics.Debug.WriteLine("Prdouct ID: " + intProductID);
                    System.Diagnostics.Debug.WriteLine("ProductPrice:" + decProductSellPrice);
                    System.Diagnostics.Debug.WriteLine("Product Quantity: " + intProductQuantity);

                    DAL.DALInvoices.insertInvoiceProduct(intInvoiceID, intProductID, intProductQuantity, decProductSellPrice);
                }

                // return invoice id for showing receipt to customer
                return intInvoiceID;
            }
            catch
            {
                throw new BusinessLayerException();
            }
        }

        public static void deactivateCart(int _intUserID)
        {
            try
            {
                int intUserID = Convert.ToInt32(_intUserID);

                DAL.DALCartAccess.updateCartSold(
                    DAL.DALCartAccess.selectCartIDByUserID(_intUserID));
            }
            catch
            {
                throw new BusinessLayerException();
            }
        }

        public static void purchaseFailure(int _intUserID)
        {

        }

        public static DataTable dtbSelectInvoiceProducts(int _intInvoiceID)
        {
            try
            {
                int intInvoiceID = Convert.ToInt32(_intInvoiceID);
                return DAL.DALInvoices.dtbSelectInvoiceProducts(_intInvoiceID);
            }
            catch
            {
                throw new BusinessLayerException();
            }
        }

        public static DataTable dtbSelectInvoice(int _intInvoiceID)
        {
            try
            {
                int intInvoiceID = Convert.ToInt32(_intInvoiceID);
                return DAL.DALInvoices.dtbSelectInvoice(_intInvoiceID);
            }
            catch
            {
                throw new BusinessLayerException();
            }
        }
    }
}