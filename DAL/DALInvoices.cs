using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Data;
using PandemicSuppliesWebApp.BL;

namespace PandemicSuppliesWebApp.DAL {
    public class DALInvoices {
        public static int intInsertOrderReturnID(int _intBillingAddressID, int _intMailingAddressID, int _intUserID, decimal _decInvoiceTotal, decimal _decPostageTotal)
        {
            // int intReturnValue = 0;
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);
            
            SqlCommand cmdInsertInvoice = new SqlCommand("Invoices_UspInsertInvoiceReturnID", conn);
            cmdInsertInvoice.CommandType = CommandType.StoredProcedure;

            // paramters
            SqlParameter[] parameters = new SqlParameter[] {
                new SqlParameter("@BillingAddressID", _intBillingAddressID),
                new SqlParameter("@MailingAddressID", _intMailingAddressID),
                new SqlParameter("@UserID", _intUserID),
                new SqlParameter("@InvoiceTotal", _decInvoiceTotal),
                new SqlParameter("@PostageCost", _decPostageTotal),
                new SqlParameter("@ReturnValue", SqlDbType.Int)
            };
            cmdInsertInvoice.Parameters.AddRange(parameters);
            cmdInsertInvoice.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;

            try
            {
                conn.Open();
                cmdInsertInvoice.ExecuteNonQuery();
                System.Diagnostics.Debug.WriteLine("insert order successful: " + (int)cmdInsertInvoice.Parameters["@ReturnValue"].Value);
                return (int) cmdInsertInvoice.Parameters["@ReturnValue"].Value;
            }
            catch
            {
                System.Diagnostics.Debug.WriteLine("inser order error");
                throw new DataAccessLayerException();
            }
        }

        public static void insertInvoiceProduct(int _intInvoiceID, int _intProductID, int _intProductQuantity, decimal _decProductSellPrice)
        {
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);

            var cmdInsertInvoiceProduct = new SqlCommand("Invoices_Products_UspInsertInvoicesProducts", conn);
            cmdInsertInvoiceProduct.CommandType = CommandType.StoredProcedure;

            SqlParameter[] parameters = new SqlParameter[] {
                new SqlParameter("@InvoiceID", _intInvoiceID),
                new SqlParameter("@ProductID", _intProductID),
                new SqlParameter("@ProductQuantity", _intProductQuantity),
                new SqlParameter("@ProductSellPrice", _decProductSellPrice)
            };
            cmdInsertInvoiceProduct.Parameters.AddRange(parameters);

            try
            {
                conn.Open();
                cmdInsertInvoiceProduct.ExecuteNonQuery();
            }
            catch
            {
                throw new BusinessLayerException();
            }
            finally
            {
                conn.Close();
            }
        }

        public static DataTable dtbSelectInvoiceProducts(int _intInvoiceID)
        {
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);
            DataTable dtbReturnTable = new DataTable();

            var cmdSelectProducts = new SqlCommand("Products_UspSelectProductsFromInvoice", conn);
            cmdSelectProducts.CommandType = CommandType.StoredProcedure;
            cmdSelectProducts.Parameters.Add(new SqlParameter("@InvoiceID", _intInvoiceID));

            try
            {
                conn.Open();

                using (SqlDataAdapter da = new SqlDataAdapter(cmdSelectProducts))
                {
                    da.Fill(dtbReturnTable);
                }
            }
            catch
            {
                throw new DataAccessLayerException();
            }
            return dtbReturnTable;
        }

        public static DataTable dtbSelectInvoices(int _intUserID)
        {
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);
            DataTable dtbReturnTable = new DataTable();

            var cmdSelectInvoices = new SqlCommand("Invoices_UspSelectInvoices", conn);
            cmdSelectInvoices.CommandType = CommandType.StoredProcedure;
            cmdSelectInvoices.Parameters.Add(new SqlParameter("@UserID", _intUserID));

            try
            {
                conn.Open();
                using (SqlDataAdapter da = new SqlDataAdapter(cmdSelectInvoices))
                {
                    da.Fill(dtbReturnTable);
                }
            }
            catch
            {
                throw new DataAccessLayerException();
            }
            finally
            {
                conn.Close();
            }
            return dtbReturnTable;
        }

        public static DataTable dtbSelectInvoice(int _intInvoiceID)
        {
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);
            DataTable dtbReturnTable = new DataTable();

            var cmdSelectInvoice = new SqlCommand("Invoices_UspSelectInvoice", conn);
            cmdSelectInvoice.CommandType = CommandType.StoredProcedure;
            cmdSelectInvoice.Parameters.Add(new SqlParameter("@InvoiceID", _intInvoiceID));

            try
            {
                conn.Open();
                using (SqlDataAdapter da = new SqlDataAdapter(cmdSelectInvoice))
                {
                    da.Fill(dtbReturnTable);
                }
            }
            catch
            {
                throw new DataAccessLayerException();
            }
            finally
            {
                conn.Close();
            }
            return dtbReturnTable;
        }
    }
}