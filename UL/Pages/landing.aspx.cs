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
    public partial class landing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    listviewProducts.DataSource = BL.BLProductDisplay.dtbReturnAllBuyableProducts();
                    listviewProducts.DataBind();
                }
                catch
                {
                    string url = ConfigurationManager.AppSettings["UnsecurePath"] + "error.aspx?ID=servererror";
                    Response.Redirect(url);
                }

            }
        }
        protected void listviewProducts_DataBound(object sender, ListViewItemEventArgs e)
        // metthod bounds urls to proper values by finding rowViw + associated sql values
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
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
                HyperLink hyperlink = (HyperLink)e.Item.FindControl("lnkProductLink");
                // retrieve productID from sql
                int intProductID = (int)rowView["ProductID"];
                // set url
                hyperlink.NavigateUrl = "product.aspx?ID=" + intProductID.ToString();
            }
        }
    }
}