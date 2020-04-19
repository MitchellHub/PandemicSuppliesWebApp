using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;

namespace PandemicSuppliesWebApp.UL.Pages.Admin
{
    public partial class adminAccounts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /* Code for GridView modified and pulled from:
            https://www.aspsnippets.com/Articles/Dynamically-create-DataTable-and-bind-to-GridView-in-ASPNet.aspx and
            https://www.aspsnippets.com/Articles/Implement-Button-Click-event-in-ASPNet-GridView-using-C-and-VBNet.aspx */

            // This code will be replaced by connection to database,
            // for now the gridviews are bound to datatables.
            // Code is mostly taken from the reference.
            if (!this.IsPostBack)
            {
                // Accounts datatable
                DataTable dtAccounts = new DataTable();
                dtAccounts.Columns.AddRange(new DataColumn[3] { 
                    new DataColumn("UserID", typeof(int)),
                    new DataColumn("Email", typeof(string)),
                    new DataColumn("IsActive", typeof(string))});
                // Add rows
                dtAccounts.Rows.Add(1, "email@email.com", "true");
                dtAccounts.Rows.Add(3, "mitchell@email.com", "false");
                // Bind datasource to gridview
                gvAccounts.DataSource = dtAccounts;
                gvAccounts.DataBind();

                // Invoice datatable
                DataTable dtTransactions = new DataTable();
                dtTransactions.Columns.AddRange(new DataColumn[3] { 
                    new DataColumn("InvoiceID", typeof(int)),
                    new DataColumn("InvoiceDate", typeof(string)),
                    new DataColumn("InvoiceTotal", typeof(string))});
                // Add rows
                dtTransactions.Rows.Add("69", "07/01/2020", "$50.00");
                dtTransactions.Rows.Add("70", "09/01/2020", "$420.00");
                dtTransactions.Rows.Add("71", "12/01/2020", "$200.00");
                // Bind data source to grid view
                gvInvoices.DataSource = dtTransactions;
                gvInvoices.DataBind();

                // InvoiceProducts Database
                DataTable dtInvoiceProducts = new DataTable();
                dtInvoiceProducts.Columns.AddRange(new DataColumn[4] {
                    new DataColumn("ProductID", typeof(int)),
                    new DataColumn("ProductQuantity", typeof(string)),
                    new DataColumn("ProductSellPrice", typeof(string)),
                    new DataColumn("ProductName", typeof(string))});
                // Add rows
                dtInvoiceProducts.Rows.Add("1", "3", "$9.95", "Hand Sanitizer");
                dtInvoiceProducts.Rows.Add("2", "1", "$19.99", "Netflix Subscription");
                // Bind data source to grid view
                gvInvoiceProducts.DataSource = dtInvoiceProducts;
                gvInvoiceProducts.DataBind();
            }
        }

        protected void btnSearchBy_Click(object sender, EventArgs e)
        {
            string strSearchCategory = lstSearchBy.SelectedValue;
            string strSearchBy = tbxSearchBy.Text;
            // query database

            lblAccountsGridViewFeedback.Text = "Displaying Search of " + strSearchBy + " in " + strSearchCategory;

            // Display GridView
            gvAccounts.Visible = true;
        }

        protected void btnDisplayAll_Click(object sender, EventArgs e)
        {
            // select all from db
            gvAccounts.Visible = true;
            lblAccountsGridViewFeedback.Text = "Displaying All User Accounts";
        }

        protected void gvAccounts_RowCommand(object sender, GridViewCommandEventArgs e)
        // Event Listener for when a row's button in the accounts table is clicked
        {
            /* Code for GridView modified and pulled from:
            https://www.aspsnippets.com/Articles/Dynamically-create-DataTable-and-bind-to-GridView-in-ASPNet.aspx and
            https://www.aspsnippets.com/Articles/Implement-Button-Click-event-in-ASPNet-GridView-using-C-and-VBNet.aspx */
            
            // check that the view button was pressed
            if (e.CommandName == "View")
            {
                // Determine the RowIndex of the Row whose Button was clicked.
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                // Reference the GridView Row.
                GridViewRow row = gvAccounts.Rows[rowIndex];

                // Check user is active
                if (row.Cells[2].Text == "true") { btnActivate.Text = "Suspend Account"; }
                else { btnActivate.Text = "Activate Account"; }

                // Update controls to display user info
                lblUserIDDisplay.Text = "UserID: " + row.Cells[0].Text;
                lblEmailDisplay.Text = "Email: " + row.Cells[1].Text;
                lblUserIDDisplay.Visible = true;
                lblEmailDisplay.Visible = true;
            }
        }

        protected void gvInvoices_RowCommand(object sender, GridViewCommandEventArgs e)
        // Event listener for when for when a row's button in the transactions table is clicked
        {
            if (e.CommandName == "ViewItems")
            {
                // Determine the RowIndex of the Row whose Button was clicked.
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                // Reference the GridView Row.
                GridViewRow row = gvInvoices.Rows[rowIndex];

                // Display Invoice Products gridview
                gvInvoiceProducts.Visible = true;

                // Update Controls
                lblInvoiceProductsGridViewFeedback.Text = "Displaying Items from InvoiceID: " + row.Cells[0].Text;
                lblInvoiceProductsGridViewFeedback.Visible = true;
            }
        }

        protected void btnViewInvoices_Click(object sender, EventArgs e)
        {
            // Display Invoices GridView
            gvInvoices.Visible = true;

            // Display Invoices Label
            lblInvoiceGridViewFeedback.Visible = true;
            lblInvoiceGridViewFeedback.Text = "Showing invoices for " + lblUserIDDisplay.Text;
        }

        protected void gvInvoiceProducts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewProduct")
            {
                // Determine the RowIndex of the Row whose Button was clicked.
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                // Reference the GridView Row.
                GridViewRow row = gvInvoiceProducts.Rows[rowIndex];

                lblInvoiceGridViewFeedback.Text = row.Cells[0].Text;

                Response.Redirect("adminProducts.aspx");
            }
        }
    }
}