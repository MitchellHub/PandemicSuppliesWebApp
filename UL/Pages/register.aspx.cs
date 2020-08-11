using System;
using System.Collections.Generic;
using System.Configuration;
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
            if (!Request.IsSecureConnection)
            {
                string url = ConfigurationManager.AppSettings["SecurePath"] + "register.aspx";
                Response.Redirect(url);
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string strEmail = tbxEmail.Text.ToString();
            string strName = tbxName.Text.ToString();
            string strPassword = tbxPassword1.Text.ToString();

            int intReturnValue = -3;   // -3 for error contacting server
            try
            {
                intReturnValue = BL.BLRegister.intRegisterUser(strEmail, strName, strPassword);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
            finally
            {
                if (intReturnValue > 0)
                {
                    Response.Redirect("registerSuccess.aspx");
                } else if (intReturnValue == -1)
                {
                    lblFeedback.Text = "Sorry, that email is already taken.";
                    lblFeedback.Visible = true;
                } else if (intReturnValue == -2 || intReturnValue == -3)  // server/db error
                {
                    lblFeedback.Text = "Sorry, there was an error contacting the server.";
                    lblFeedback.Visible = true;
                }
            }
        }
    }
}