using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PandemicSuppliesWebApp.UL.Pages.Admin
{
    public partial class Site1Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strUserID = Convert.ToString(Session["User_ID"]);

            if (strUserID != "2")   // check user is admin
            {
                Response.Redirect("~/UL/Pages/error.aspx");
            }
        }
    }
}