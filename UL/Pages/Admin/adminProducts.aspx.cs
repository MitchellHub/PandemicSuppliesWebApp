using System;
using System.Data;
using System.Web.UI.WebControls;

namespace PandemicSuppliesWebApp.UL.Pages.Admin
{
    public partial class adminProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /* Code for GridView modified and pulled from:
            https://www.aspsnippets.com/Articles/Dynamically-create-DataTable-and-bind-to-GridView-in-ASPNet.aspx and
            https://www.aspsnippets.com/Articles/Implement-Button-Click-event-in-ASPNet-GridView-using-C-and-VBNet.aspx */

            // This code will be replaced by connection to database,
            // for now the gridviews are bound to datatables.
            // Code is mostly taken from the reference.
            if (!IsPostBack)
            {
                // InvoiceProducts Database
                DataTable dtProducts = new DataTable();
                dtProducts.Columns.AddRange(new DataColumn[8] {
                    new DataColumn("ProductID", typeof(int)),
                    new DataColumn("ProductName", typeof(string)),
                    new DataColumn("ProductDesc", typeof(string)),
                    new DataColumn("ProductPrice", typeof(string)),
                    new DataColumn("StockLevel", typeof(int)),
                    new DataColumn("IsAvailable", typeof(string)),
                    new DataColumn("ImgSource", typeof(string)),
                    new DataColumn("IsActive", typeof(string))});
                // Add rows
                dtProducts.Rows.Add(1, "Hand Sanitizer 50ml", "Cleans Hands", "9.95", 7, "true", "hand_sanitizer.jpg", "true");
                dtProducts.Rows.Add(2, "Netflix Subscription", "Video-streaming service subscription", "19.95", 0, "false", "netflix.jpg", "true");
                dtProducts.Rows.Add(3, "Pandemic Supplies Riot Gas Mask Military Grade", "Genuine military-grade gas mask. Riot mask included.", "299.95", 4, "true", "gas_mask.jpg", "true");
                dtProducts.Rows.Add(4, "Bottled Water", "100% h2o", "9.95", 99, "true", "water.jpg", "false");
                // Bind data source to grid view
                gvProducts.DataSource = dtProducts;
                gvProducts.DataBind();
            }
        }

        protected void btnSearchBy_Click(object sender, EventArgs e)
        {

        }

        protected void btnDisplayAll_Click(object sender, EventArgs e)
        {

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
                lblProductID.Text = "ProductID: " + row.Cells[0].Text;
                tbxProductName.Text = row.Cells[1].Text;
                tbxProductDesc.Text = row.Cells[2].Text;
                tbxProductPrice.Text = row.Cells[3].Text;
                tbxStockLevel.Text = row.Cells[4].Text;
                //btnIsAvailable.Text = row.Cells[5].Text;
                tbxImgSource.Text = row.Cells[6].Text;
                //btnIsActive.Text = row.Cells[5].Text;
            }
        }

        protected void btnConfirmEdit_Click(object sender, EventArgs e)
        {
            lblEditProductFeedback.Visible = true;
            lblEditProductFeedback.Text = "Product Edited";
            // updateLabels();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            lblEditProduct.Text = "Edit: ";
            // resetLabels();
        }
    }
}