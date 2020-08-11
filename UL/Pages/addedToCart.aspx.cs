using PandemicSuppliesWebApp.BL;
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
    public partial class addedToCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsSecureConnection)
            {
                string url = ConfigurationManager.AppSettings["SecurePath"] + "addedToCart.aspx";
                Response.Redirect(url);
            }
            if (!IsPostBack)
            {
                // grab product id
                int intProductID = Convert.ToInt32(Request["ID"]);
                // redirect to login if session variable == null
                if (Session["User"] == null)
                {
                    Response.Redirect("login.aspx?ID=" + Request["ID"].ToString());
                } 
                else
                {
                    try
                    {
                        // grab session
                        BL.User usrSession = (BL.User)Session["User"];
                        // retrieve product 
                        DataTable dtbProductData = BL.BLProductDisplay.dtbReturnProductByID(intProductID);
                        // grab data row for simplicity
                        DataRow drwProductData = dtbProductData.Rows[0];

                        // check product in stock and available
                        if (Convert.ToInt32(drwProductData["StockLevel"]) > 0 || !Convert.ToBoolean(drwProductData["IsActive"]))
                        {   
                            // if available, add to cart and fill html values
                            BL.BLCart.addProductToCart(usrSession.UserID, intProductID, 1);
                            fillHtmlValues(drwProductData, usrSession.UserID);
                        }
                        else
                        {
                            throw new ArgumentException("Product Unavailable");
                        }
                    }
                    catch (ArgumentException ex)
                    {
                        System.Diagnostics.Debug.WriteLine(ex.ToString());
                        Response.Redirect("error.aspx?ID=productunavailable");
                    }
                    catch (Exception ex)
                    {
                        System.Diagnostics.Debug.WriteLine(ex.ToString());
                        Response.Redirect("error.aspx?ID=servererror");
                    }
                }
            }
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("cart.aspx");
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("checkoutPayment.aspx");
        }
        private void fillHtmlValues(DataRow drwProductData, int _intUserID)
        {
            // set nav url of image
            linkProductPage.NavigateUrl = "product.aspx?ID=" + drwProductData["ProductID"].ToString();
            
            // set image url
            byte[] bytArray = (byte[])drwProductData["ProductImage"];
            string strBase64 = Convert.ToBase64String(bytArray);
            imgProductImage.ImageUrl = "data:Image/jpg;base64, " + strBase64;
            // set nav url for title
            linkProductPageTitle.NavigateUrl = "product.aspx?ID=" + drwProductData["ProductID"].ToString();
            // set title text
            lblProductTitle.Text = drwProductData["ProductName"].ToString();
            // set subtotal text
            lblCartSubTotal.Text = "Cart Subtotal (" + BL.BLCart.intCartTotalProducts(_intUserID) + " Items): ";
            // set subtotal price
            lblCartSubTotalPrice.Text = "$" + BL.BLCart.decCartTotalPrice(_intUserID).ToString();
        }
    }
}