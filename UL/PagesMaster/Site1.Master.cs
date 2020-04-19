using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PandemicSuppliesWebApp.UL.PagesMaster
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strUserID = Convert.ToString(Session["User_ID"]);

            if (Session["User_Name"] != null) { linkAccount.Text = "Hi, " + Session["User_Name"]; }

            if (strUserID == "2")  // if user is admin, log them out - they shouldn't be in customer site
            {
                Response.Redirect("~/UL/Pages/logOut.aspx");
            }
            else if (strUserID != "1")  // check if user is logged in or not
            {
                linkAccount.NavigateUrl = "~/UL/Pages/login.aspx";
            }
        }

        protected void linkCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("cart.aspx");
        }
    }
}