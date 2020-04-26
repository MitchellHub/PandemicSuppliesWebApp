using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PandemicSuppliesWebApp.UL.Pages
{
    public partial class cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            // pressing remove will not redirect user, but will remove item from cart
            // for now, just disabling the mask item
            divFirstProduct.Visible = false;
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            if (Session["User_ID"] != null)
                Response.Redirect("checkoutPayment.aspx");
            else
                Response.Redirect("login.aspx");
        }
    }
}