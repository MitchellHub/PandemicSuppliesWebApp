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
            //Response.Write("<script>alert('login successful');</script>");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // grab login values
            string strEmail = Convert.ToString(tbxEmail.Text);
            string strPassword = Convert.ToString(tbxPassword.Text);
            // grab product ID (sent from product page if redirected from there), otherwise ID = 0
            int intProductID = Convert.ToInt32(Request["ID"]);

            BL.User usrLogin = new BL.User();
            usrLogin.UserID = -3;   // default userID, to see if lower layers have been contacted
            // this is a bit silly, in future i would do this another way

            try
            {
                usrLogin = BL.BLLogin.usrLoginUser(strEmail, strPassword);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
            finally
            {
                if (usrLogin.UserID > 0)
                {
                    Session["User"] = usrLogin;
                    if (usrLogin.IsAdmin == true)
                    {
                        Response.Redirect("Admin/adminDashboard.aspx"); // if user is admin, redirect to dashboard
                    } 
                    else if (intProductID > 0)  // case for login page redirected from a product page
                    {
                        Response.Redirect("product.aspx?ID=" + intProductID);
                    } 
                    else
                    {
                        Response.Redirect("main.aspx"); // else go to main
                    }
                } 
                else if (usrLogin.UserID == 0)
                {
                    lblFeedback.Text = "Sorry, the password does not match the email";
                    lblFeedback.Visible = true;
                } 
                else if (usrLogin.UserID == -1)
                {
                    lblFeedback.Text = "Sorry, that email address is unrecognized";
                    lblFeedback.Visible = true;
                } 
                else if (usrLogin.UserID == -2) // DB error
                {
                    lblFeedback.Text = "Sorry there was an error contacting the server.";
                    lblFeedback.Visible = true;
                } 
                else if (usrLogin.UserID == -3) // Server error
                {
                    lblFeedback.Text = "Sorry there was an error contacting the server.";
                    lblFeedback.Visible = true;
                }
            }
        }
    }
}