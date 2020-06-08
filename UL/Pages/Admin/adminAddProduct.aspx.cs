using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PandemicSuppliesWebApp.UL.Pages.Admin
{
    public partial class adminAddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminDashboard.aspx");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        // method sends product info to lower layers
        {
            string strProdName = tbxProductName.Text.ToString();
            string strProdDesc = tbxProductDesc.Text.ToString();
            // string strProductPrice = lblProductPrice.Text.ToString();

            string strProductPrice = tbxProductPrice.Text;
            string intStockLevel = tbxStockLevel.Text;
            bool boolIsActive = cbxIsActive.Checked;
            string strImgSource = tbxImgSource.Text.ToString();

            int intReturnID = BL.BLAdminAddProduct.addProductReturnID(strProdName, strProdDesc, strProductPrice, intStockLevel, boolIsActive, strImgSource);

            if (intReturnID > 0)
                lblFeedback.Text = "Successfully added the product to database with ID: " + intReturnID;
            else if (intReturnID == -1)
                lblFeedback.Text = "Invalid input data.";
            else
                lblFeedback.Text = "There was a problem communicating with the server.";
            /*
        catch (Exception ex)
        {
            lblFeedback.Text = "There was a problem querying the server. Exception code: " + ex.ToString();
        }*/
        }
    }
}