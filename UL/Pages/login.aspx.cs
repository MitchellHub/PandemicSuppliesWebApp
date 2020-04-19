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

            // getUserID(email, password);

            if (strEmail == strAEmail && strPassword == strAPassword)
            {
                Session["User_ID"] = 1;
                Session["User_Name"] = "SpongeBob";
                // login();
                Response.Redirect("main.aspx");
            }
            else if ((strEmail == strAEmail && strPassword != strAPassword) || 
                    (strEmail == strAdminAEmail && strPassword != strAdminAPassword))
            {
                lblFeedback.Visible = true;
                lblFeedback.Text = "Sorry, your password is incorrect";
            }
            else if (strEmail == strAdminAEmail && strPassword == strAdminAPassword)
            {
                Session["User_ID"] = 2;
                Session["User_Name"] = "Admin";
                Response.Redirect("Admin/adminDashboard.aspx");
            }
            else
            {
                lblFeedback.Visible = true;
                lblFeedback.Text = "Sorry, your username and password combination is incorrect";
            }
        }

        private string getUserID(string strAEmail, string strAPassword)
        {
            // query database
            // return real user id
            return strAEmail;
        }
    }
}