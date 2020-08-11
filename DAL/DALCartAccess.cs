using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PandemicSuppliesWebApp.DAL {
    public class DALCartAccess {
        public static int selectCartIDByUserID(int _intUserID)
            // returns CartID of a User, -1 if none found
        {
            int intCartID = 0;
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);

            SqlCommand cmdGetCartID = new SqlCommand("Carts_UspSelectCartID", conn);
            cmdGetCartID.CommandType = CommandType.StoredProcedure;
            cmdGetCartID.Parameters.Add(new SqlParameter("@UserID", _intUserID));
            cmdGetCartID.Parameters.Add(new SqlParameter("@ReturnValue", SqlDbType.Int));
            cmdGetCartID.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;

            try
            {
                conn.Open();
                cmdGetCartID.ExecuteNonQuery();
                if (cmdGetCartID.Parameters["@ReturnValue"].Value != null)
                    intCartID = (int)cmdGetCartID.Parameters["@ReturnValue"].Value;
                else
                    intCartID = -1;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                System.Diagnostics.Debug.WriteLine("no cart found");
                return -1;
            }
            finally
            {
                conn.Close();
            }
            System.Diagnostics.Debug.WriteLine("CartID: " + intCartID.ToString());
            return intCartID;
        }

        public static void insertProductIntoCart(int _intCartID, int _intProductID, int _intAmount)
            // method inserts a carts_products entry to carts_products
            // also updates respective carts entry 
        {
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);

            SqlCommand cmdInsertProduct = new SqlCommand("Carts_Products_UspInsertProduct", conn);
            cmdInsertProduct.CommandType = CommandType.StoredProcedure;

            // parameters
            SqlParameter[] parameters = new SqlParameter[] {
                new SqlParameter("@CartID", _intCartID),
                new SqlParameter("@ProductID", _intProductID),
                new SqlParameter("@ProductQuantity", _intAmount)
            };
            cmdInsertProduct.Parameters.AddRange(parameters);

            try
            {
                conn.Open();
                cmdInsertProduct.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                System.Diagnostics.Debug.WriteLine("insertProductIntoCartException");
            }
        }
        public static bool boolCheckCartExists(int _intUserID)
            // returns true if a cart is found, false if not
        {
            bool boolReturnValue = false;

            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);
            
            SqlCommand cmdCheckCart = new SqlCommand("Carts_UspSelectCartReturnBool", conn); // create sql command
            cmdCheckCart.CommandType = CommandType.StoredProcedure;                     // set command type to stored procedure
            cmdCheckCart.Parameters.Add(new SqlParameter("@UserID", _intUserID));       // set in param
            cmdCheckCart.Parameters.Add(new SqlParameter("@ReturnValue", SqlDbType.Bit));
            cmdCheckCart.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;
            
            try
            {
                conn.Open();
                cmdCheckCart.ExecuteNonQuery();
                boolReturnValue = (bool)cmdCheckCart.Parameters["@ReturnValue"].Value;

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
            finally
            {
                conn.Close();
            }
            return boolReturnValue;
        }
        public static void insertCart(int _intUserID)
            // method inserts a cart by userID
        {
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);

            SqlCommand cmdInsertCart = new SqlCommand("Carts_UspInsertCart", conn);
            cmdInsertCart.CommandType = CommandType.StoredProcedure;
            cmdInsertCart.Parameters.Add(new SqlParameter("@UserID", _intUserID));

            try
            {
                conn.Open();
                cmdInsertCart.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
        }

        public static int intSelectProductQuantityFromCart(int _intCartID, int _intProductID)
        {
            int intProductQuantity = -1;
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);

            SqlCommand cmdProductQuantity = new SqlCommand("Carts_Products_UspSelectProductQuantity", conn);
            cmdProductQuantity.CommandType = CommandType.StoredProcedure;

            // add parameters
            SqlParameter[] parameters = new SqlParameter[] {
                new SqlParameter("@CartID", _intCartID),
                new SqlParameter("@ProductID", _intProductID)
            };
            cmdProductQuantity.Parameters.AddRange(parameters);

            try
            {
                conn.Open();
                intProductQuantity = (int)cmdProductQuantity.ExecuteScalar();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
            return intProductQuantity;
        }

        public static int intSumTotalProducts(int _intCartID)
            // method returns the sum of all products in cart
        {
            int intTotalProducts = -1;
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);

            SqlCommand cmdSumProducts = new SqlCommand("Carts_Products_UspSumProductQuantityOfCart", conn);
            cmdSumProducts.CommandType = CommandType.StoredProcedure;

            cmdSumProducts.Parameters.Add(new SqlParameter("@CartID", _intCartID));

            try
            {
                conn.Open();
                intTotalProducts = (int)cmdSumProducts.ExecuteScalar();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
            return intTotalProducts;
        }

        public static decimal decSumTotalPrice(int _intCartID)
        {
            decimal decTotalPrice = 0.00m;
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);

            SqlCommand cmdCartTotalPrice = new SqlCommand("Carts_Products_UspSumCartProductsPrice", conn);
            cmdCartTotalPrice.CommandType = CommandType.StoredProcedure;
            cmdCartTotalPrice.Parameters.Add(new SqlParameter("@CartID", _intCartID));

            try
            {
                conn.Open();
                decTotalPrice = (decimal)cmdCartTotalPrice.ExecuteScalar();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
            finally
            {
                conn.Close();
            }
            return decTotalPrice;
        }

        public static DataTable dtbSelectAllCartProductsInfo(int _intCartID)
        {
            DataTable dtbReturnTable = new DataTable();
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);

            SqlCommand cmdCartProducts = new SqlCommand("[Products_UspSelectProductsFromCart]", conn);
            cmdCartProducts.CommandType = CommandType.StoredProcedure;
            cmdCartProducts.Parameters.Add(new SqlParameter("@CartID", _intCartID));

            try
            {
                conn.Open();
                using (SqlDataAdapter da = new SqlDataAdapter(cmdCartProducts))
                {
                    da.Fill(dtbReturnTable);
                    System.Diagnostics.Debug.WriteLine("fill with cart products");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
            return dtbReturnTable;
        }

        public static void updateCartSold(int _intCartID)
        {
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);

            var cmdUpdateIsActive = new SqlCommand("Carts_UspUpdateCartSold", conn);
            cmdUpdateIsActive.CommandType = CommandType.StoredProcedure;
            cmdUpdateIsActive.Parameters.Add(new SqlParameter("@CartID", _intCartID));

            try
            {
                conn.Open();
                cmdUpdateIsActive.ExecuteNonQuery();
            }
            catch
            {
                throw new DataAccessLayerException();
            }
            finally
            {
                conn.Close();
            }
        }
    }
}