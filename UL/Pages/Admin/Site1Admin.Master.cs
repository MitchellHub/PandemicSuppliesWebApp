using PandemicSuppliesWebApp.DAL;
using System;
using System.Collections.Generic;
using System.Configuration;
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
            BL.User usrSession = (BL.User) Session["User"];

            if (!usrSession.IsAdmin || usrSession == null)   // check user is admin
                Response.Redirect("~/UL/Pages/error.aspx?ID=privilegeerror");
        }
    }
}