using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PandemicSuppliesWebApp.UL.PagesMaster
{
    public partial class Site1Checkout : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
                Response.Redirect("~/UL/Pages/login.aspx");

            // set number of items in cart link
            var usrSession = (BL.User)Session["User"];
            linkCart.Text = (int)BL.BLCart.intCartTotalProducts(usrSession.UserID) + " Items";
        }
    }
}