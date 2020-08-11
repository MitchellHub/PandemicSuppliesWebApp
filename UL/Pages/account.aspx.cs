using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PandemicSuppliesWebApp.UL.Pages
{
    public partial class account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsSecureConnection)
            {
                string url = ConfigurationManager.AppSettings["SecurePath"] + "account.aspx";
                Response.Redirect(url);
            }
        }

        protected void btnOrders_Click(object sender, EventArgs e)
        {
            Response.Redirect("orders.aspx");
        }

        protected void btnAccountSettings_Click(object sender, EventArgs e)
        {
            Response.Redirect("accountSettings.aspx");
        }

        protected void btnAddresses_Click(object sender, EventArgs e)
        {
            Response.Redirect("accountAddresses.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("logout.aspx");
        }
    }
}