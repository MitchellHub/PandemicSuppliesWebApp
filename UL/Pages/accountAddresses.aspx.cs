using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PandemicSuppliesWebApp.UL.Pages
{
    public partial class accountAddresses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
                Response.Redirect("login.aspx");
            if (!IsPostBack)
            {
                // get session
                BL.User usrSession = (BL.User)Session["User"];
                try
                {
                    fillListWithAddresses(usrSession.UserID);
                }
                catch
                {
                    Response.Redirect("error.aspx?ID=servererror");
                }
            }
        }

        protected void btnAddAddress_Click(object sender, EventArgs e)
        {
            Response.Redirect("accountAddressesAddAddress.aspx");
        }

        private void fillListWithAddresses(int _intUserID)
        {
            lvwBillingAddresses.DataSource = BL.BLAccountAddresses.dtbSelectBillingAddresses(
                Convert.ToInt32(_intUserID));
            lvwBillingAddresses.DataBind();
        }

        protected void lvwBillingAddresses_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            var usrSession = (BL.User)Session["User"];
            if (e.CommandName == "remove")
            {   // deactivate address by addressID
                BL.BLAccountAddresses.deactivateBillingAddress(Convert.ToInt32(e.CommandArgument));
                fillListWithAddresses(usrSession.UserID);
            }
            else if (e.CommandName == "setDefault")
            {   // set default address for user
                BL.BLAccountAddresses.setDefaultBillingAddress(usrSession.UserID,
                    Convert.ToInt32(e.CommandArgument));
                fillListWithAddresses(usrSession.UserID);
            }
        }
    }
}