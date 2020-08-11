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
    public partial class checkoutConfirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // get session
            BL.User usrSession = (BL.User)Session["User"];
            // grab invoice id, which should be been sent by checkout page
            int intInvoiceID = Convert.ToInt32(Request["ID"]);

            if (intInvoiceID > 0 & usrSession != null)
            {
                try
                {
                    fillOrderHtml(intInvoiceID);
                }
                catch
                {
                    string url = ConfigurationManager.AppSettings["UnsecurePath"] + "error.aspx";
                    Response.Redirect(url);
                }
            } else
            {
                string url = ConfigurationManager.AppSettings["UnsecurePath"] + "error.aspx?ID=privilegeerror";
                Response.Redirect(url);
            }

        }

        private void fillOrderHtml(int _intInvoiceID)
        {
            lvwInvoiceProducts.DataSource = BL.BLCheckout.dtbSelectInvoiceProducts(_intInvoiceID);
            lvwInvoiceProducts.DataBind();
            DataTable dtbInvoice = BL.BLCheckout.dtbSelectInvoice(_intInvoiceID);
            DataRow drwInvoice = dtbInvoice.Rows[0];
            lblTotalInvoiceCost.Text = drwInvoice["InvoiceTotal"].ToString();
        }

        protected void lvwInvoiceProducts_ItemDataBound(object sender, ListViewItemEventArgs e)
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

                    // find image
                    Image image = (Image)e.Item.FindControl("imgProductImage");
                    // retrieve image from sql
                    byte[] bytArray = (byte[])rowView["ProductImage"];
                    // convert to string
                    string strBase64 = Convert.ToBase64String(bytArray);
                    // set url
                    image.ImageUrl = "data:Image/jpg;base64, " + strBase64;

                    // find hyperlink
                    HyperLink hyperlink = (HyperLink)e.Item.FindControl("linkProductPage");
                    // retrieve productID from sql
                    int intProductID = (int)rowView["ProductID"];
                    // set url
                    hyperlink.NavigateUrl = "product.aspx?ID=" + intProductID.ToString();
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