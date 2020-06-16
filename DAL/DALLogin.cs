using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;

namespace PandemicSuppliesWebApp.DAL
{
    public class DALLogin {
        
        public static User usrLoginUser(string _strEmail, string _strPassword)
        {
            string strEm = _strEmail.ToString();
            string strPwd = _strPassword.ToString();
            //System.Diagnostics.Debug.WriteLine(strEm);
            //System.Diagnostics.Debug.WriteLine(strPwd);

            User usrRtnUser = new User();
            usrRtnUser.UserID = -3;

            if (strEm != "")
            {
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);
                    
                SqlCommand cmdLoginAndReturnUser = new SqlCommand("Users_UspLoginAndReturnUser", conn);     // create sql command
                cmdLoginAndReturnUser.CommandType = CommandType.StoredProcedure;                             // set command type to stored procedure

                // in paramater
                cmdLoginAndReturnUser.Parameters.Add(new SqlParameter("@Email", SqlDbType.VarChar, 254));    // add in param
                cmdLoginAndReturnUser.Parameters["@Email"].Value = strEm;                                    // email parameter = strEm
                cmdLoginAndReturnUser.Parameters["@Email"].Direction = ParameterDirection.Input;
                // in paramater
                cmdLoginAndReturnUser.Parameters.Add(new SqlParameter("@Password", SqlDbType.VarChar, 50));    // add in param
                cmdLoginAndReturnUser.Parameters["@Password"].Value = strPwd;                                    // email parameter = strEm
                cmdLoginAndReturnUser.Parameters["@Password"].Direction = ParameterDirection.Input;
                // UserID out parameter
                cmdLoginAndReturnUser.Parameters.Add(new SqlParameter("@UserID", SqlDbType.Int));       // add out param
                cmdLoginAndReturnUser.Parameters["@UserID"].Direction = ParameterDirection.Output;      // direction = output
                // Name out parameter
                cmdLoginAndReturnUser.Parameters.Add(new SqlParameter("@FirstName", SqlDbType.VarChar, 250));
                cmdLoginAndReturnUser.Parameters["@FirstName"].Direction = ParameterDirection.Output;
                // IsActive out parameter
                cmdLoginAndReturnUser.Parameters.Add(new SqlParameter("@IsActive", SqlDbType.Bit));
                cmdLoginAndReturnUser.Parameters["@IsActive"].Direction = ParameterDirection.Output;
                // IsAdmin out parameter
                cmdLoginAndReturnUser.Parameters.Add(new SqlParameter("@IsAdmin", SqlDbType.Bit));
                cmdLoginAndReturnUser.Parameters["@IsAdmin"].Direction = ParameterDirection.Output;
                // ReturnValue out parameter
                cmdLoginAndReturnUser.Parameters.Add(new SqlParameter("@ReturnValue", SqlDbType.Int));
                cmdLoginAndReturnUser.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;

                //SqlParameter[] parameters = new SqlParameter[] {
                //    new SqlParameter("@Email", SqlDbType.VarChar, 254),
                //    new SqlParameter("@Name", SqlDbType.Int),
                //    new SqlParameter("@ReturnValue", SqlDbType.Int)
                //};

                //cmdLoginAndReturnUser.Parameters.AddRange(parameters);

                //cmdLoginAndReturnUser.Parameters["@Email"].Value = strEm;
                //cmdLoginAndReturnUser.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;

                try
                {
                    System.Diagnostics.Debug.WriteLine("start try");
                    conn.Open();
                    cmdLoginAndReturnUser.ExecuteNonQuery();                                                    // execute query
                    
                    System.Diagnostics.Debug.WriteLine("post connection");
                    usrRtnUser.UserID = (int)cmdLoginAndReturnUser.Parameters["@ReturnValue"].Value;            // cast out param to int

                    System.Diagnostics.Debug.WriteLine((int)cmdLoginAndReturnUser.Parameters["@ReturnValue"].Value);

                    if (usrRtnUser.UserID > 0)  // if login is successful, populate user object
                    {
                        usrRtnUser.Name = (string)cmdLoginAndReturnUser.Parameters["@FirstName"].Value;
                        usrRtnUser.IsActive = (bool)cmdLoginAndReturnUser.Parameters["@IsActive"].Value;
                        usrRtnUser.IsAdmin = (bool)cmdLoginAndReturnUser.Parameters["@IsAdmin"].Value;
                        usrRtnUser.Email = strEm;
                        System.Diagnostics.Debug.WriteLine("assigning parameters success");

                    }
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
            System.Diagnostics.Debug.WriteLine(usrRtnUser.UserID.ToString());
            return usrRtnUser;
        }
    }
}