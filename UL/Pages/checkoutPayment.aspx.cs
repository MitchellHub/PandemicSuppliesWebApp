using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PandemicSuppliesWebApp.UL.Pages
{
    public partial class checkoutPayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnAddDeliveryAddress_Click(object sender, EventArgs e)
        {
            Response.Redirect("checkoutAddDeliveryAddress.aspx");
        }
        protected void btnAddBillingAddress_Click(object sender, EventArgs e)
        {
            Response.Redirect("checkoutAddBillingAddress.aspx");
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            Response.Redirect("checkoutConfirmation.aspx");
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            // pressing remove will not redirect user, but will remove item from cart
            // for now, just disabling the mask item
            divFirstProduct.Visible = false;
        }
    }
}