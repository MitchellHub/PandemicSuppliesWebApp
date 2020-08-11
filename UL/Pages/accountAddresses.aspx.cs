using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
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

            if (!Request.IsSecureConnection)
            {
                string url = ConfigurationManager.AppSettings["SecurePath"] + "accountAddresses.aspx";
                Response.Redirect(url);
            }
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
                    string url = ConfigurationManager.AppSettings["UnsecurePath"] + "error.aspx?ID=servererror";
                    Response.Redirect(url);
                }
            }
        }

        protected void btnAddAddress_Click(object sender, EventArgs e)
        {
            string url = ConfigurationManager.AppSettings["SecurePath"] + "accountAddressesAddAddress.aspx";
            Response.Redirect(url);
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

        protected void lvwMailingAddresses_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            var usrSession = (BL.User)Session["User"];
            if (e.CommandName == "remove")
            {   // deactivate address by addressID
                BL.BLAccountAddresses.deactivateMailingAddress(Convert.ToInt32(e.CommandArgument));
                fillListWithAddresses(usrSession.UserID);
            } 
            else if (e.CommandName == "setDefault")
            {   // set default address for user
                BL.BLAccountAddresses.setDefaultMailingAddress(usrSession.UserID,
                    Convert.ToInt32(e.CommandArgument));
                fillListWithAddresses(usrSession.UserID);
            }
            /*
            else if (e.CommandName == "editAddress")
            {

            }
            */
        }

        private void fillListWithAddresses(int _intUserID)
        {
            // populate billing address list view
            lvwBillingAddresses.DataSource = BL.BLAccountAddresses.dtbSelectBillingAddresses(
                Convert.ToInt32(_intUserID));
            lvwBillingAddresses.DataBind();
            // populate mailing address list view
            lvwMailingAddresses.DataSource = BL.BLAccountAddresses.dtbSelectMailingAddresses(
                Convert.ToInt32(_intUserID));
            lvwMailingAddresses.DataBind();
        }

        protected void lvwAddresses_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            // checks for unit no == null, and address is default
            // if no unit no, don't display unit no
            // if default, add default label
            // both list views share this method
            {
                if (e.Item.ItemType == ListViewItemType.DataItem)
                {
                    try
                    {
                        // grab session userID
                        BL.User usrSession = (BL.User)Session["User"];
                        int intUserID = (int)usrSession.UserID;
                        // find row view
                        DataRowView rowView = (DataRowView)e.Item.DataItem;
                        // find unitNo label
                        Label labelUnitNo = (Label)e.Item.FindControl("lblUnitNo");
                        // find default label
                        Label labelDefault = (Label)e.Item.FindControl("lblDefaultAddress");

                        // hide unit no if null
                        if (rowView["UnitNo"].ToString() != "")
                        {
                            labelUnitNo.Visible = true;
                            labelUnitNo.Text = rowView["UnitNo"].ToString() + ", ";
                        }
                        if ((bool)rowView["IsDefault"])
                            labelDefault.Visible = true;
                    }
                    catch
                    {
                        Response.Redirect("error.aspx?ID=servererror");
                    }
                }
            }
        }
    }
}