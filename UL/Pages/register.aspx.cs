using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PandemicSuppliesWebApp.UL.Pages
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string strEmail = Convert.ToString(tbxEmail.Text);
            string strName = Convert.ToString(tbxName.Text);
            string strAEmail = "email@email.com";
            string strAAdminEmail = "admin@email.com";

            if (strEmail == strAEmail || strEmail == strAAdminEmail) // query database to check email isn't taken
            {
                lblFeedback.Visible = true;
                lblFeedback.Text = "Sorry, an account is already registered with that email.";
                linkResetPwd.Visible = true;
            }
            // else if (admin email entered) {}
            else
            {
                // create new user in database
                Session["User_ID"] = 3;
                Session["User_Name"] = strName;
                // register();
                Response.Redirect("account.aspx");
            }
        }

        /*
        register()
        {
            // send OTP to email?
        }
        */
    }
}