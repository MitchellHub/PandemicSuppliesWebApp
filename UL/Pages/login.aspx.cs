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

            if (strEmail == strAEmail && strPassword == strAPassword)
            {
                Session["User_ID"] = 1;
                Response.Redirect("main.aspx");
            }
            else
            {
                lblFeedback.Visible = true;
                lblFeedback.Text = "Sorry, your username or password is incorrect";
            }
        }
    }
}