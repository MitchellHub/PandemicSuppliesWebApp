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

            string strAEmail = "email@email.com";
            string strAPassword = "password";

            string strAdminAEmail = "admin@email.com";
            string strAdminAPassword = "admin1";

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
        }
    }
}