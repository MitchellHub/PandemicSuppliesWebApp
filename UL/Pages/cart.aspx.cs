﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PandemicSuppliesWebApp.UL.Pages
{
    public partial class cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsSecureConnection)
            {
                string url = ConfigurationManager.AppSettings["SecurePath"] + "cart.aspx";
                Response.Redirect(url);
            }
            if (Session["User"] == null)
                Response.Redirect("login.aspx");
            if (!IsPostBack)
            {
                // get session
                BL.User usrSession = (BL.User)Session["User"];

                // check a cart exists, or a cart exists and has no items
                if ((int)BL.BLCart.intSelectCartID(usrSession.UserID) <= 0 || (int)BL.BLCart.intCartTotalProducts(usrSession.UserID) <= 0)
                {
                    lblCartTotalPrice.Visible = false;
                    lblCartTotal.Visible = false;
                    btnCheckout.Visible = false;
                    lblFeedback.Text = "No items in cart yet !";
                    lblFeedback.Visible = true;
                }

                try
                {
                    fillCartWithProducts(usrSession.UserID);
                }
                catch
                {
                    string url = ConfigurationManager.AppSettings["UnsecurePath"] + "error.aspx";
                    Response.Redirect(url);
                }
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            UserLayerHelper.RedirectToCheckout((BL.User) Session["User"], lblFeedback);
        }

        protected void listviewCartProducts_ItemDataBound(object sender, ListViewItemEventArgs e)
            // populates each item of the list view
            // this could probably be done a better way
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

                    // grab qty label
                    Label labelProductQty = (Label)e.Item.FindControl("lblProductQty");
                    // set productquantity
                    labelProductQty.Text = BL.BLCart.intSingularProductQuantityFromCart(
                        intUserID, (int)rowView["ProductID"]).ToString();
                }
                catch
                {
                    string url = ConfigurationManager.AppSettings["UnsecurePath"] + "error.aspx";
                    Response.Redirect(url);
                }
            }
        }

        protected void listviewCartProducts_ItemCommand(object sender, ListViewCommandEventArgs e)
            // removes a product from the cart
        {
            if (e.CommandName == "cmdRemoveProduct")
            {
                try
                {
                    int intProductID = Convert.ToInt32(e.CommandArgument);
                    BL.User usrSession = (BL.User)Session["User"];
                    int intUserID = Convert.ToInt32(usrSession.UserID);

                    BL.BLCart.removeProductFromCart(intUserID, intProductID);
                    fillCartWithProducts(intUserID);
                }
                catch
                {
                    string url = ConfigurationManager.AppSettings["UnsecurePath"] + "error.aspx?ID=servererror";
                    Response.Redirect(url);
                }
            }
        }

        private void fillCartWithProducts(int _intUserID)
        {
            listviewCartProducts.DataSource = BL.BLCart.dtbSelectAllCartProducts(Convert.ToInt32(_intUserID));
            listviewCartProducts.DataBind();

            // cart totals
            lblCartTotal.Text = "Cart Subtotal (" + BL.BLCart.intCartTotalProducts(_intUserID) + " Items): ";
            lblCartTotalPrice.Text = "$" + BL.BLCart.decCartTotalPrice(_intUserID).ToString();
        }
    }
}