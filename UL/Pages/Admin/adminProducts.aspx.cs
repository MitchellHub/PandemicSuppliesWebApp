using System;
using System.Data;
using System.Drawing;
using System.Web.UI.WebControls;

namespace PandemicSuppliesWebApp.UL.Pages.Admin
{
    public partial class adminProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblEditProductFeedback.Text = "";
            if (!IsPostBack)
            {
                fillGridViewWithAllProducts();
                resetControls();
            }
        }

        protected void btnSearchBy_Click(object sender, EventArgs e)
        {
            string strSearchID = tbxSearchBy.Text.ToString();
            lblProductsGridViewFeedback.Text = "Displaying Search for ProductID: " + strSearchID;

            DataTable dtbProducts = BL.BLAdminProducts.dtbReturnProducts(strSearchID);

            try
            {
                gvProducts.DataSource = dtbProducts;
                gvProducts.DataBind();
            }
            catch (Exception ex)
            {
                lblProductsGridViewFeedback.Text = ex.ToString();
            }
        }

        protected void btnDisplayAll_Click(object sender, EventArgs e)
        {
            fillGridViewWithAllProducts();
            lblProductsGridViewFeedback.Text = "Displaying All Products";
        }

        protected void fillGridViewWithAllProducts()
        {
            DataTable dtbProducts = BL.BLAdminProducts.dtbReturnProducts("0");
            gvProducts.DataSource = dtbProducts;
            gvProducts.DataBind();
            gvProducts.Visible = true;
        }

        protected void gvProducts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // check that the view button was pressed
            if (e.CommandName == "View")
            {
                // Determine the RowIndex of the Row whose Button was clicked.
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                // Reference the GridView Row.
                GridViewRow row = gvProducts.Rows[rowIndex];

                // Update Controls
                lblEditProduct.Text = "Editing: " + row.Cells[1].Text;
                lblProductIDValue.Text = row.Cells[0].Text;
                tbxProductName.Text = row.Cells[1].Text;
                tbxProductDesc.Text = row.Cells[2].Text;
                tbxProductPrice.Text = row.Cells[3].Text;
                tbxStockLevel.Text = row.Cells[4].Text;

                // Grab image byte array, convert to string, set as image url
                byte[] bytImageArray = BL.BLAdminProducts.bytReturnProductImage(Convert.ToInt32(row.Cells[0].Text));
                string strBase64 = Convert.ToBase64String(bytImageArray);
                imgProductImage.ImageUrl = "data:Image/jpg;base64, " + strBase64;
                lblEditProductFeedback.Visible = true;

                if (row.Cells[6].Text == "True")
                    cbxIsActive.Checked = true;
                else
                    cbxIsActive.Checked = false;
            }
        }

        protected void btnConfirmEdit_Click(object sender, EventArgs e)
            // method UPDATES a product
        {
            if (lblProductIDValue.Text == "")
            {
                lblEditProductFeedback.Text = "Must select a product to edit";
                lblEditProductFeedback.ForeColor = Color.Red;
                lblEditProductFeedback.Visible = true;
            } 
            else
            {
                string strProductID = lblProductIDValue.Text.ToString();
                string strProductName = tbxProductName.Text.ToString();
                string strProductDesc = tbxProductDesc.Text.ToString();
                string strProductPrice = tbxProductPrice.Text.ToString();
                string strStockLevel = tbxStockLevel.Text.ToString();
                // string strImgSource = "test";
                bool boolIsActive = cbxIsActive.Checked;

                try
                {
                    BL.BLAdminProducts.updateProductData(strProductID, strProductName, strProductDesc, strProductPrice, strStockLevel, boolIsActive);

                    fillGridViewWithAllProducts();
                    resetControls();

                    lblEditProductFeedback.Text = "Product Edited";
                    lblEditProductFeedback.ForeColor = Color.Green;
                    lblEditProductFeedback.Visible = true;
                }
                catch
                {
                    lblEditProductFeedback.Text = "There was an error contacting the server";
                    lblEditProductFeedback.ForeColor = Color.Red;
                    lblEditProductFeedback.Visible = true;
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            resetControls();

        }

        protected void resetControls()
        {
            lblEditProductFeedback.Text = "";
            lblEditProductFeedback.ForeColor = Color.Black;
            lblEditProductFeedback.Visible = false;
            lblEditProduct.Text = "Editing: ";
            lblProductIDValue.Text = "";
            tbxProductName.Text = "";
            tbxProductDesc.Text = "";
            tbxProductPrice.Text = "";
            tbxStockLevel.Text = "";
            // tbxImgSource.Text = "";
        }
    }
}