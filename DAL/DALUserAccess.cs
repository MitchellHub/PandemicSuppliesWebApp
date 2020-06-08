using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PandemicSuppliesWebApp.DAL {
    public class DALUserAccess {
        public static DataTable dtbNonAdminUsers(int _intSearchID)
            // method returns all users if searchID == 0, or returns user with matching ID
        {
            System.Diagnostics.Debug.WriteLine(_intSearchID);

            DataTable dtbAccounts = new DataTable();
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);
            SqlCommand cmdAccountsQuery;

            if (_intSearchID == 0)  // if search term id is 0, return all users
            {
                cmdAccountsQuery = new SqlCommand("Users_UspReturnNonAdminUsers", conn);        // create command
                cmdAccountsQuery.CommandType = CommandType.StoredProcedure;                     // set type to sp
            }
            else                    // else there is a search id
            {
                cmdAccountsQuery = new SqlCommand("Users_UspReturnNonAdminUsersByID", conn);    // create command
                cmdAccountsQuery.CommandType = CommandType.StoredProcedure;                     // set to sp
                cmdAccountsQuery.Parameters.Add(new SqlParameter("@UserID", SqlDbType.Int));    // add param
                cmdAccountsQuery.Parameters["@UserID"].Value = _intSearchID;                    // set param to ID
                cmdAccountsQuery.Parameters["@UserID"].Direction = ParameterDirection.Input;    // set direction to input
            }
            
            // try to query db
            try
            {
                System.Diagnostics.Debug.WriteLine("try");
                conn.Open();
                using (SqlDataAdapter da = new SqlDataAdapter(cmdAccountsQuery))
                {
                    da.Fill(dtbAccounts);
                    System.Diagnostics.Debug.WriteLine("fill");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex);
                System.Diagnostics.Debug.WriteLine("sql error");
            }
            finally
            {
                conn.Close();
            }
            return dtbAccounts;
        }
    }
}