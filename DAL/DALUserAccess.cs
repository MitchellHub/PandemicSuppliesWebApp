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
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);

            DataTable dtbAccounts = new DataTable();
            
            SqlCommand cmdAccountsQuery;

            if (_intSearchID == 0)  // if search term id is 0, return all users
            {
                cmdAccountsQuery = new SqlCommand("Users_UspReturnNonAdminUsers", conn);        // create command
                cmdAccountsQuery.CommandType = CommandType.StoredProcedure;                     // set type to sp
            }
            else                    // else there is a search id
            {
                cmdAccountsQuery = new SqlCommand("Users_UspReturnUserByID", conn);    // create command
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

        public static void updateUserIsActiveStatusInDatabase(int _intUserID, bool _boolIsActive)
        {
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);
            
            // create command
            SqlCommand cmdUpdateIsActive = new SqlCommand("Users_UspUpdateIsActiveByUserID", conn);
            cmdUpdateIsActive.CommandType = CommandType.StoredProcedure;

            // parameters
            SqlParameter[] parameters = new SqlParameter[] {
                new SqlParameter("@UserID", _intUserID),
                new SqlParameter("@IsActive", _boolIsActive)
            };
            cmdUpdateIsActive.Parameters.AddRange(parameters);

            try
            {
                conn.Open();
                cmdUpdateIsActive.ExecuteNonQuery();
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

        public static DataTable dtbSelectUserByID(int _intUserID)
        {
            int intUserID = Convert.ToInt32(_intUserID);
            var dtbReturn = new DataTable();
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);

            SqlCommand cmdSelectUser = new SqlCommand("Users_UspReturnUserByID", conn);
            cmdSelectUser.CommandType = CommandType.StoredProcedure;
            cmdSelectUser.Parameters.Add(new SqlParameter("@UserID", _intUserID));

            try
            {
                conn.Open();
                using (SqlDataAdapter da = new SqlDataAdapter(cmdSelectUser))
                {
                    da.Fill(dtbReturn);
                    System.Diagnostics.Debug.WriteLine("grab user");
                }
            }
            catch(Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.ToString());
                throw new DataAccessLayerException();
            }
            finally
            {
                conn.Close();
            }
            return dtbReturn;
        }

        public static void updateUserName(string _strNewName, int _intUserID)
        {
            int intUserID = Convert.ToInt32(_intUserID);
            string strNewName = _strNewName.ToString();
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);

            SqlCommand cmdUpdateName = new SqlCommand("Users_UspUpdateName", conn);
            cmdUpdateName.CommandType = CommandType.StoredProcedure;
            cmdUpdateName.Parameters.Add(new SqlParameter("@UserID", intUserID));
            cmdUpdateName.Parameters.Add(new SqlParameter("@FirstName", strNewName));

            try
            {
                conn.Open();
                cmdUpdateName.ExecuteNonQuery();
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