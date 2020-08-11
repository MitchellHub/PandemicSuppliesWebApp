using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PandemicSuppliesWebApp.UL.Pages
{
    public partial class resetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsSecureConnection)
            {
                string url = ConfigurationManager.AppSettings["SecurePath"] + "resetPassword.aspx";
                Response.Redirect(url);
            }
        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            string strEmail = "email@email.com";
            string strAEmail = Convert.ToString(tbxEmail.Text);

            if (strEmail == strAEmail)
            {
                string url = ConfigurationManager.AppSettings["UnsecurePath"] + "resetPasswordConfirmation.aspx";
                Response.Redirect(url);
            }
            else
            {
                lblFeedback.Text = "That email is not registered to an account";
                lblFeedback.Visible = true;
            }
                
        }
    }
}