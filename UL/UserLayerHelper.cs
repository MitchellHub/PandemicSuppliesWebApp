using PandemicSuppliesWebApp.BL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PandemicSuppliesWebApp.UL
{
    public class UserLayerHelper
    {
        public static void RedirectToCheckout(User usrSession, Label errorLabel)
        {
            var page = HttpContext.Current.CurrentHandler as Page;

            System.Diagnostics.Debug.WriteLine("hello");

            if (usrSession != null)
            {
                System.Diagnostics.Debug.WriteLine("hello2");
                if (usrSession.CheckCartHasitems())
                    page.Response.Redirect("checkoutPayment.aspx");
                else
                {
                    errorLabel.Text = "You don't have any items in your cart to checkout!";
                    errorLabel.Visible = true;
                }

            }
            else
            {
                page.Response.Redirect("login.aspx");
            }
        }
    }
}