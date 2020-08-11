using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PandemicSuppliesWebApp.UL.Pages
{
    public partial class checkoutAddDeliveryAddress : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsSecureConnection)
            {
                string url = ConfigurationManager.AppSettings["SecurePath"] + "checkoutAddDeliveryAddress.aspx";
                Response.Redirect(url);
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("checkoutPayment.aspx");
        }

        protected void btnAddAddress_Click(object sender, EventArgs e)
        {
            Response.Redirect("checkoutPayment.aspx");
        }
    }
}