using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PandemicSuppliesWebApp.UL.Pages
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string strEmail = Convert.ToString(tbxEmail.Text);
            string strPassword = Convert.ToString(tbxPassword.Text);
            string strFeedback = "";

            DAL.User usrLogin = new DAL.User();
            usrLogin.UserID = -3;   // default userID, to see if lower layers have been contacted


            try
            {
                usrLogin = BL.BLLogin.usrLoginUser(strEmail, strPassword);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                Console.WriteLine("User Layer Exception");
            }
            finally
            {
                if (usrLogin.UserID > 0)
                {
                    strFeedback = "Success";
                } 
                else if (usrLogin.UserID == 0)
                {
                    strFeedback = "Sorry, the password does not match the email";
                } 
                else if (usrLogin.UserID == -1)
                {
                    strFeedback = "Sorry, that email address is unrecognized";
                } 
                else if (usrLogin.UserID == -2)
                {
                    strFeedback = "Error Querying Database";
                } 
                else if (usrLogin.UserID == -3)
                {
                    strFeedback = "Error Contacting the server";
                }
            }

            if (strFeedback == "Success")
            {
                Session["User"] = usrLogin;
                if (usrLogin.IsAdmin == true)
                    Response.Redirect("Admin/adminDashboard.aspx"); // if user is admin, redirect to dashboard
                else
                    Response.Redirect("main.aspx"); // else go to main
            }
            else
            {
                lblFeedback.Text = strFeedback;
                lblFeedback.Visible = true;
            }
        }

        /*
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string strEmail = Convert.ToString(tbxEmail.Text);
            string strPassword = Convert.ToString(tbxPassword.Text);

            string strRtn = BL.BLLogin.strCheckLogin(strEmail, strPassword);

            lblFeedback.Text = strRtn;
            lblFeedback.Visible = true;
        }
        */

        //lblFeedback.Text = strRtn;

        //if (strRtn != "Unknown Email" /*&& BL.BLLogin.boolCheckUserNotAdmin(strRtn)*/)
        //{
        //    try
        //    {
        //        loginUser(strRtn);
        //    }
        //    catch(Exception ex)
        //    {
        //        Console.WriteLine(ex.ToString());
        //        strRtn = "Login unsuccessful";
        //    }
        //}





        /*
        // correct details for customer account
        if (strEmail == strAEmail && strPassword == strAPassword)
        {
            Session["User_ID"] = 1;
            Session["User_Name"] = "SpongeBob";
            // login();
            Response.Redirect("main.aspx");
        }
        // correct details for admin account
        else if (strEmail == strAdminAEmail && strPassword == strAdminAPassword)
        {
            Session["User_ID"] = 2;
            Session["User_Name"] = "Admin";
            Response.Redirect("Admin/adminDashboard.aspx");
        }
        // email correct, password incorrect
        else if ((strEmail == strAEmail && strPassword != strAPassword) || 
                (strEmail == strAdminAEmail && strPassword != strAdminAPassword))
        {
            lblFeedback.Visible = true;
            lblFeedback.Text = "Sorry, your password is incorrect";
        }
        // email incorrect
        else
        {
            lblFeedback.Visible = true;
            lblFeedback.Text = "Sorry, the email entered is not registered.";
        }
        */
        //private void loginUser(string strRtn)
        //{
        //    Session["User_ID"] = strRtn;
        //    Session["User_Name"] = "spongeBob";
        //    lblFeedback.Visible = true;
        //    lblFeedback.Text = strRtn;
        //    // Session["User_Name"] = BL.BLLogin.strFindUserName(strRtn);
        //    // Response.Redirect("main.aspx");
        //}
    }
}