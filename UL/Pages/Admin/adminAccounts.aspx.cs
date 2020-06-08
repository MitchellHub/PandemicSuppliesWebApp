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
            fillGridViewWithAllAccounts();
        }

        protected void btnSearchBy_Click(object sender, EventArgs e)
        {
            string strSearchID = tbxSearchBy.Text.ToString();

            lblAccountsGridViewFeedback.Text = "Displaying Search for UserID: " + strSearchID;

            // create data table querying by search terms and category
            DataTable dtbAccounts = BL.BLAdminAccounts.dtbAccounts(strSearchID);

            try
            {
                // Bind datasource to gridview
                gvAccounts.DataSource = dtbAccounts;
                gvAccounts.DataBind();
            }
            catch (Exception ex)
            {
                lblAccountsGridViewFeedback.Text = ex.ToString();
            }
            
        }

        protected void btnDisplayAll_Click(object sender, EventArgs e)
        {
            fillGridViewWithAllAccounts();
        }

        protected void fillGridViewWithAllAccounts()
        {
            lblAccountsGridViewFeedback.Text = "Displaying All User Accounts";
            DataTable dtbAccounts = BL.BLAdminAccounts.dtbAccounts("0");
            gvAccounts.DataSource = dtbAccounts;
            gvAccounts.DataBind();
            gvAccounts.Visible = true;
        }

        protected void gvAccounts_RowCommand(object sender, GridViewCommandEventArgs e)
        // Event Listener for when a row's button in the accounts table is clicked
        {
            // check that the view button was pressed
            
            if (e.CommandName == "View")
            {
                // Determine the RowIndex of the Row whose Button was clicked.
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                // Reference the GridView Row.
                GridViewRow row = gvAccounts.Rows[rowIndex];

                // Check user is active
                if (row.Cells[4].Text == "true") { btnActivate.Text = "Suspend Account"; }
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
            /*
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
            */
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
            /*
            if (e.CommandName == "ViewProduct")
            {
                // Determine the RowIndex of the Row whose Button was clicked.
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                // Reference the GridView Row.
                GridViewRow row = gvInvoiceProducts.Rows[rowIndex];

                lblInvoiceGridViewFeedback.Text = row.Cells[0].Text;

                Response.Redirect("adminProducts.aspx");
            }
            */
        }
    }
}