using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PandemicSuppliesWebApp.UL.Pages
{
    public partial class product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    // retrieve productID and assign product to data table
                    int intProductID = Convert.ToInt32(Request["ID"]);
                    // it may be redundant to grab a whole data table, but this way it can work with 
                    // pre-existing data access methods
                    DataTable dtbProductData = BL.BLProductDisplay.dtbReturnProductByID(intProductID);
                    // grab data row for simplicity
                    DataRow drwProductData = dtbProductData.Rows[0];

                    // check product is active
                    if (!Convert.ToBoolean(drwProductData["IsActive"]))
                    {
                        throw new ArgumentException("Product Unavailable");
                    }
                    else
                    {
                        // assign html values from data row
                        // product image url
                        byte[] bytArray = (byte[])drwProductData["ProductImage"];
                        string strBase64 = Convert.ToBase64String(bytArray);
                        imgProductImage.ImageUrl = "data:Image/jpg;base64, " + strBase64;
                        // product name
                        lblProductTitle.Text = drwProductData["ProductName"].ToString();
                        // price
                        lblProductPrice.Text = "$" + drwProductData["ProductPrice"].ToString();
                        // stock availability
                        if (Convert.ToInt32(drwProductData["StockLevel"]) > 0)
                        {
                            lblProductStockStatus.Text = "In-Stock!";
                            lblProductStockStatus.ForeColor = Color.Green;
                            btnAddToCart.Visible = true;
                        }
                        else
                        {
                            lblProductStockStatus.Text = "Out-of-Stock!";
                            lblProductStockStatus.ForeColor = Color.Red;
                            btnAddToCart.Visible = false;

                        }
                        // stock level
                        lblProductQuantityAvailable.Text = "(" + drwProductData["StockLevel"].ToString() + ") Available";
                        // description 
                        lblProductDescription.Text = drwProductData["ProductDesc"].ToString();
                    }
                }
                catch(ArgumentException ex)
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

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("addedToCart.aspx?ID=" + Request["ID"]);
        }
    }
}