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
    public partial class orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsSecureConnection)
            {
                string url = ConfigurationManager.AppSettings["SecurePath"] + "orders.aspx";
                Response.Redirect(url);
            }
            if (Session["User"] == null)
                Response.Redirect("login.aspx");

            // get session
            BL.User usrSession = (BL.User)Session["User"];

            try
            {
                DataTable dtbInvoices = BL.BLAccountInvoices.dtbSelectInvoices((int)usrSession.UserID);
                lvwInvoices.DataSource = dtbInvoices;
                lvwInvoices.DataBind();
            }
            catch
            {
                string url = ConfigurationManager.AppSettings["UnsecurePath"] + "error.aspx";
                Response.Redirect(url);
            }
        }

        protected void lvwInvoices_ItemDataBound(object sender, ListViewItemEventArgs e)
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

                    Label lblAddress = (Label)e.Item.FindControl("lblDeliveryAddress");
                    //Label lblTotal = (Label)e.Item.FindControl("lblTotal");

                    DataRow drwAddress = BL.BLAccountInvoices.dtbSelectMailingAddress((int)rowView["MailingAddressID"]);
                    lblAddress.Text =
                        drwAddress.Field<string>("StreetNo") + " " +
                        drwAddress.Field<string>("Street") + ", " +
                        drwAddress.Field<string>("Suburb") + ", " +
                        drwAddress.Field<string>("PostCode") + ", " +
                        drwAddress.Field<string>("State");

                }
                catch
                {
                    string url = ConfigurationManager.AppSettings["UnsecurePath"] + "error.aspx";
                    Response.Redirect(url);
                }
            }
        }
    }
}