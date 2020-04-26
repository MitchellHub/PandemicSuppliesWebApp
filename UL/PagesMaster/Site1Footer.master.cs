using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PandemicSuppliesWebApp.UL.PagesMaster
{
    public partial class Site1Footer : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strUserID = Convert.ToString(Session["User_ID"]);
            string strUserName = Convert.ToString(Session["User_Name"]);

            lblCartStock.Text = "3";

            if (Session["User_ID"] != null)     // if user is logged in
            {
                linkAccount.Text = "Hi, " + strUserName;
                lblCartStock.Text = "3";
                linkOrders.NavigateUrl = "~/UL/Pages/orders.aspx";
                linkAccount.NavigateUrl = "~/UL/Pages/account.aspx";
                // maybe format url with account.aspx?UserID={0}
            }
            else                                // if user is not logged in
            {
                linkAccount.Text = "Login";
                lblCartStock.Text = "";
                linkAccount.NavigateUrl = "~/UL/Pages/login.aspx";
                linkOrders.NavigateUrl = "~/UL/Pages/login.aspx";
                // lblCartStock.Text = "";
            }

            if (strUserID == "2")  // if user is admin, log them out - they shouldn't be in customer site
                Response.Redirect("~/UL/Pages/logOut.aspx");
        }
        protected void linkCart_Click(object sender, EventArgs e)
        {
            // users should be able to add items to a cart without making an account,
            // but for now redirect to login page

            if (Session["User_ID"] != null)
                Response.Redirect("~/UL/Pages/cart.aspx");
            else
                Response.Redirect("~/UL/Pages/login.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            // need to implement 'enter key' functionality
            if (tbxSearch.Text == "")
                Response.Redirect("~/UL/Pages/main.aspx");
            else
                Response.Redirect("~/UL/Pages/search.aspx?Search=" + tbxSearch.Text);
        }
    }
}