using System;
using System.Collections.Generic;
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

        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            string strEmail = "email@email.com";
            string strAEmail = Convert.ToString(tbxEmail.Text);

            if (strEmail == strAEmail)
                Response.Redirect("resetPasswordConfirmation.aspx");
            else
            {
                lblFeedback.Text = "That email is not registered to an account";
                lblFeedback.Visible = true;
            }
                
        }
    }
}