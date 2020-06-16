using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PandemicSuppliesWebApp.DAL {
    public class DALProductAccess {
        public static int addProductToDatabaseReturnID(string _strProdName, string _strProdDesc, decimal _decProductPrice, int _intStockLevel, bool _boolIsActive, string _strImgSource)
        // method inserts a product into the Products table using a stored procedure
        {
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);
            SqlCommand cmdAddProduct = new SqlCommand("Products_UspInsertProduct", conn);
            cmdAddProduct.CommandType = CommandType.StoredProcedure;

            int intProductID = 0;

            // parameters
            SqlParameter[] parameters = new SqlParameter[] {
                new SqlParameter("@ProductName", _strProdName),
                new SqlParameter("@ProductDesc", _strProdDesc),
                new SqlParameter("@ProductPrice", _decProductPrice),
                new SqlParameter("@StockLevel", _intStockLevel),
                new SqlParameter("@ImgSource", _strImgSource),
                new SqlParameter("@IsActive", _boolIsActive),
                new SqlParameter("@ProductID", intProductID)
            };
            cmdAddProduct.Parameters.AddRange(parameters);
            cmdAddProduct.Parameters["@ProductID"].Direction = ParameterDirection.Output;

            try
            {
                System.Diagnostics.Debug.WriteLine("start try");
                conn.Open();
                cmdAddProduct.ExecuteNonQuery();
                intProductID = (int)cmdAddProduct.Parameters["@ProductID"].Value;
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

        public static void updateProductDataInDatabase(int _intProductID, string _strProductName, string _strProductDesc, decimal _decProductPrice, int _intStockLevel, string _strImgSource, bool _boolIsActive)
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
                new SqlParameter("@ImgSource", _strImgSource),
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

        public static DataTable dtbReturnProducts(int _intSearchID)
        // method returns all products if searchID == 0, or returns product with matching ProductID
        {
            DataTable dtbProducts = new DataTable();
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);
            SqlCommand cmdProductsQuery;

            if (_intSearchID == 0)  // if search id 0, return all users
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
                    System.Diagnostics.Debug.WriteLine("fill");
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
    }
}