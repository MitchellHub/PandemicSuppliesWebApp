using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PandemicSuppliesWebApp.UL.Pages
{
    public partial class error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strErrorID = Request["ID"];

            if (strErrorID == "servererror")
                lblFeedback.Text = "Sorry, there was an error contacting the server";
            if (strErrorID == "privilegeerror")
                lblFeedback.Text = "Sorry, you were trying to access a page that you don't have permission for";
            if (strErrorID == "productunavailable")
                lblFeedback.Text = "Sorry, the product you're trying to view is unavailable right now!";
        }
    }
}