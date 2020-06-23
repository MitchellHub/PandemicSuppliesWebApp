using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Drawing;

namespace PandemicSuppliesWebApp.UL.Pages.Admin
{
    public partial class adminAccounts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                fillGridViewWithAllAccounts();
        }

        // ********** ********** ********** Buttons ********** ********** **********  //

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


        protected void gvAccounts_RowCommand(object sender, GridViewCommandEventArgs e)
            // Event Listener for when a row's button in the accounts table is clicked
            // 'selects' a user by sending info to labels
        {
            // check that the view button was pressed
            if (e.CommandName == "View")
            {
                // Determine the RowIndex of the Row whose Button was clicked.
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                // Reference the GridView Row.
                GridViewRow row = gvAccounts.Rows[rowIndex];

                // Update controls to display user info
                lblUserIDValue.Text = row.Cells[0].Text;
                lblEmailValue.Text = row.Cells[1].Text;
                lblNameValue.Text = row.Cells[2].Text;

                if (row.Cells[4].Text == "True") 
                {   // if user IsActive status == true, display deactivate button
                    lblIsActiveValue.Text = "True";
                    btnDeActivate.Visible = true;
                    btnActivate.Visible = false;
                } 
                else
                {   // else show activate button
                    lblIsActiveValue.Text = "False";
                    btnActivate.Visible = true;
                    btnDeActivate.Visible = false;
                }

                // Display Button
                btnViewInvoices.Visible = true;
            }
        }


        protected void btnViewInvoices_Click(object sender, EventArgs e)
        {
            // Display Invoices GridView
            gvInvoices.Visible = true;

            // Display Invoices Label
            lblInvoiceGridViewFeedback.Visible = true;
            lblInvoiceGridViewFeedback.Text = "Showing invoices for " + lblUserIDValue.Text;
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

        protected void btnActivate_Click(object sender, EventArgs e)
            // method will change selected user's IsActive to True
        {
            // retrieve userID
            string strUserID = lblUserIDValue.Text.ToString();

            try
            {
                BL.BLAdminAccounts.setUserIsActiveStatus(strUserID, true);      // query db

                lblAccountsInfoFeedback.Text = "Successfully Activated account";
                lblAccountsInfoFeedback.Visible = true;
                lblAccountsInfoFeedback.ForeColor = Color.Green;
            }
            catch
            {
                lblAccountsInfoFeedback.Text = "There was a problem contacting the server";
                lblAccountsInfoFeedback.Visible = true;
                lblAccountsInfoFeedback.ForeColor = Color.Red;
            }

            // reset controls
            resetUserInfoControls();
            fillGridViewWithAllAccounts();
        }
        protected void btnDeactivate_Click(object sender, EventArgs e)
            // method will change a selected user's IsActive to False
        {
            // retrieve userID
            string strUserID = lblUserIDValue.Text.ToString();
            try
            {
                BL.BLAdminAccounts.setUserIsActiveStatus(strUserID, false);     // query db
                lblAccountsInfoFeedback.Text = "Successfully Deactivated account";
                lblAccountsInfoFeedback.Visible = true;
                lblAccountsInfoFeedback.ForeColor = Color.Green;
            }
            catch
            {
                lblAccountsInfoFeedback.Text = "There was a problem contacting the server";
                lblAccountsInfoFeedback.Visible = true;
                lblAccountsInfoFeedback.ForeColor = Color.Red;
            }
            // reset controls
            resetUserInfoControls();
            fillGridViewWithAllAccounts();
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

        // ********** ********** ********** Methods ********** ********** **********  //
        private void fillGridViewWithAllAccounts()
        {
            lblAccountsGridViewFeedback.Text = "Displaying All User Accounts";
            DataTable dtbAccounts = BL.BLAdminAccounts.dtbAccounts("0");    // query db with '0' to return all accounts
            gvAccounts.DataSource = dtbAccounts;
            gvAccounts.DataBind();
            gvAccounts.Visible = true;
        }

        private void resetUserInfoControls()
        {
            lblUserIDValue.Text = "";
            lblNameValue.Text = "";
            lblEmailValue.Text = "";
            lblIsActiveValue.Text = "";

            btnActivate.Visible = false;
            btnDeActivate.Visible = false;
            btnViewInvoices.Visible = false;
        }
    }
}