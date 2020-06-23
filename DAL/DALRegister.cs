using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PandemicSuppliesWebApp.DAL {
    public class DALRegister {
        public static int intRegisterNonAdminUser(string _strEmail, string _strFirstName, string _strPassword)
            // method inserts a user into db, and returns int
            // -3 for sql server contact error
            // -2 for db access error
            // -1 for email not found
            // 0 for email found, password wrong
            // if I re-wrote this assignment, I probably wouldn't do it this way. 
            // I would probably just return the UserID from the DB, rather than a user object
        {
            int intReturnValue = -2;

            if (_strEmail != "")
            {
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);

                SqlCommand cmdRegisterUser = new SqlCommand("Users_UspInsertUserAfterEmailCheck", conn);
                cmdRegisterUser.CommandType = CommandType.StoredProcedure;

                // parameters
                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@Email", _strEmail),
                    new SqlParameter("@FirstName", _strFirstName),
                    new SqlParameter("@Password", _strPassword),
                    new SqlParameter("@IsSuperAdmin", false),
                    new SqlParameter("@IsAdmin", false),
                    new SqlParameter("@IsActive", true),
                    new SqlParameter("@ReturnValue", SqlDbType.Int)
                };
                // add params, set return to output
                cmdRegisterUser.Parameters.AddRange(parameters);
                cmdRegisterUser.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;

                try
                {
                    conn.Open();
                    cmdRegisterUser.ExecuteNonQuery();
                    intReturnValue = (int)cmdRegisterUser.Parameters["@ReturnValue"].Value;
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.ToString());
                    System.Diagnostics.Debug.WriteLine("DAL Exception");
                }
                finally
                {
                    conn.Close();
                }
            }
            return intReturnValue;
        }
    }
}