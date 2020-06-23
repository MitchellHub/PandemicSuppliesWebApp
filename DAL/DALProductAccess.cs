using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PandemicSuppliesWebApp.DAL {
    public class DALProductAccess {
        public static int addProductToDatabaseReturnID(string _strProdName, string _strProdDesc, decimal _decProductPrice, int _intStockLevel, bool _boolIsActive, byte[] _bytImgArray)
        // method inserts a product into the Products table using a stored procedure
        {
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);
            SqlCommand cmdAddProduct = new SqlCommand("Products_UspInsertProductWithImage", conn);
            cmdAddProduct.CommandType = CommandType.StoredProcedure;

            int intProductID = 0;

            // parameters
            SqlParameter[] parameters = new SqlParameter[] {
                new SqlParameter("@ProductName", _strProdName),
                new SqlParameter("@ProductDesc", _strProdDesc),
                new SqlParameter("@ProductPrice", _decProductPrice),
                new SqlParameter("@StockLevel", _intStockLevel),
                new SqlParameter("@ProductImage", _bytImgArray),
                new SqlParameter("@IsActive", _boolIsActive),
                new SqlParameter("@ProductID", intProductID)
            };
            cmdAddProduct.Parameters.AddRange(parameters);
            cmdAddProduct.Parameters["@ProductID"].Direction = ParameterDirection.Output;

            try
            {
                System.Diagnostics.Debug.WriteLine("open connection");
                conn.Open();
                cmdAddProduct.ExecuteNonQuery();
                intProductID = (int)cmdAddProduct.Parameters["@ProductID"].Value;
                System.Diagnostics.Debug.WriteLine("query executed");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.ToString());
            }
            finally
            {
                conn.Close();
            }
            return intProductID;
        }

        public static void updateProductDataInDatabase(int _intProductID, string _strProductName, string _strProductDesc, decimal _decProductPrice, int _intStockLevel, bool _boolIsActive)
            // method updates a product in the db using a stored procedure
        {
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);
            
            SqlCommand cmdUpdateProductQuery = new SqlCommand("Products_UspUpdateProductByID", conn);
            cmdUpdateProductQuery.CommandType = CommandType.StoredProcedure;

            // parameters
            SqlParameter[] parameters = new SqlParameter[] {
                new SqlParameter("@ProductID", _intProductID),
                new SqlParameter("@ProductName", _strProductName),
                new SqlParameter("@ProductDesc", _strProductDesc),
                new SqlParameter("@ProductPrice", _decProductPrice),
                new SqlParameter("@StockLevel", _intStockLevel),
                new SqlParameter("@IsActive", _boolIsActive)
            };
            cmdUpdateProductQuery.Parameters.AddRange(parameters);

            try
            {
                conn.Open();
                cmdUpdateProductQuery.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.ToString());
            }
            finally
            {
                conn.Close();
            }
        }

        public static DataTable dtbSelectProducts(int _intSearchID)
        // method returns all products if searchID == 0, or returns product with matching ProductID
        {
            DataTable dtbProducts = new DataTable();
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);
            SqlCommand cmdProductsQuery;

            if (_intSearchID == 0)  // if search id 0, return all products
            {
                cmdProductsQuery = new SqlCommand("Products_UspReturnProducts", conn);
                cmdProductsQuery.CommandType = CommandType.StoredProcedure;
            }
            else {                  // else there is a search id
                cmdProductsQuery = new SqlCommand("Products_UspReturnProductByID", conn);
                cmdProductsQuery.CommandType = CommandType.StoredProcedure;
                cmdProductsQuery.Parameters.Add(new SqlParameter("@ProductID", _intSearchID));
                cmdProductsQuery.Parameters["@ProductID"].Direction = ParameterDirection.Input;
            }
            try
            {
                conn.Open();
                using (SqlDataAdapter da = new SqlDataAdapter(cmdProductsQuery))
                {
                    da.Fill(dtbProducts);
                    System.Diagnostics.Debug.WriteLine("fill with products");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex);
            }
            finally
            {
                conn.Close();
            }
            return dtbProducts;
        }

        public static DataTable dtbReturnActiveProducts()
            // method returns all active products 
        {
            DataTable dtbProducts = new DataTable();
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);
            SqlCommand cmdProductsQuery;

            cmdProductsQuery = new SqlCommand("Products_UspReturnActiveProducts", conn);
            cmdProductsQuery.CommandType = CommandType.StoredProcedure;

            try
            {
                conn.Open();
                using (SqlDataAdapter da = new SqlDataAdapter(cmdProductsQuery))
                {
                    da.Fill(dtbProducts);
                    System.Diagnostics.Debug.WriteLine("fill with products");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex);
            }
            finally
            {
                conn.Close();
            }
            return dtbProducts;
        }

        public static DataTable dtbSelectActiveAndInStockProducts()
            // method returns all active and stocklevel > 0 products
        {
            DataTable dtbProducts = new DataTable();
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);
            SqlCommand cmdProductsQuery;

            cmdProductsQuery = new SqlCommand("Products_UspReturnActiveAndInStockProducts", conn);
            cmdProductsQuery.CommandType = CommandType.StoredProcedure;

            try
            {
                conn.Open();
                using (SqlDataAdapter da = new SqlDataAdapter(cmdProductsQuery))
                {
                    da.Fill(dtbProducts);
                    System.Diagnostics.Debug.WriteLine("fill with products");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex);
            }
            finally
            {
                conn.Close();
            }
            return dtbProducts;
        }
        public static byte[] bytReturnProductImage(int _intProductID)
            // method returns the byte array of a product's image, by product ID
        {
            byte[] bytImageArray = null;
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);
            SqlCommand cmdReturnImage = new SqlCommand("Products_UspReturnImageById", conn);    // sql command
            cmdReturnImage.CommandType = CommandType.StoredProcedure;                           // command type
            cmdReturnImage.Parameters.Add(new SqlParameter("@ProductID", _intProductID));       // add ID param

            try
            {
                conn.Open();
                bytImageArray = (byte[])cmdReturnImage.ExecuteScalar(); // cast return value to byte[] and assign
                System.Diagnostics.Debug.WriteLine("retrieve image");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex);
            }
            finally
            {
                conn.Close();
            }
            return bytImageArray;
        }
    }
}