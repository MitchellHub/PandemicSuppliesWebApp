using System;
using System.Data;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using INFT3050.PaymentSystem;
using System.Linq.Expressions;
using System.Drawing;

namespace PandemicSuppliesWebApp.UL.Pages
{
    public partial class checkoutPayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsSecureConnection)
            {
                string url = ConfigurationManager.AppSettings["SecurePath"] + "checkoutPayment.aspx";
                Response.Redirect(url);
            }
            if (!IsPostBack)
            {
                // get session
                if (Session["User"] == null)
                    Response.Redirect("~/UL/Pages/login.aspx");

                BL.User usrSession = (BL.User)Session["User"];
                
                // check a cart exists - user won't be able to access this page unless they go though URL
                if (BL.BLCart.intSelectCartID(usrSession.UserID) <= 0)
                {
                    string url = ConfigurationManager.AppSettings["UnsecurePath"] + "main.aspx";
                    Response.Redirect(url);
                }
                // check the cart has items
                if (!usrSession.CheckCartHasitems())
                {
                    string url = ConfigurationManager.AppSettings["UnsecurePath"] + "error.aspx?ID=privilegeerror";
                    Response.Redirect(url);
                }

                try
                {
                    fillListWithAddresses((int)usrSession.UserID);
                    fillCartWithProducts((int)usrSession.UserID);
                }
                catch
                {
                    string url = ConfigurationManager.AppSettings["UnsecurePath"] + "error.aspx";
                    Response.Redirect(url);
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            string url = ConfigurationManager.AppSettings["SecurePath"] + "cart.aspx";
            Response.Redirect(url);
        }

        private void fillListWithAddresses(int _intUserID)
        {
            // bound delivery addresses
            repeaterMailingAddresses.DataSource = BL.BLAccountAddresses.dtbSelectMailingAddresses(
                Convert.ToInt32(_intUserID));
            repeaterMailingAddresses.DataBind();

            // bound billing addresses
            repeaterBillingAddresses.DataSource = BL.BLAccountAddresses.dtbSelectBillingAddresses(
                Convert.ToInt32(_intUserID));
            repeaterBillingAddresses.DataBind();
        }

        private void fillCartWithProducts(int _intUserID)
        {
            listviewCartProducts.DataSource = BL.BLCart.dtbSelectAllCartProducts(Convert.ToInt32(_intUserID));
            listviewCartProducts.DataBind();
            lblCartTotal.Text = "Cart Subtotal (" + BL.BLCart.intCartTotalProducts(_intUserID) + " Items): ";
            lblCartTotalPrice.Text = "$" + BL.BLCart.decCartTotalPrice(_intUserID).ToString();
        }

        protected void repeaterMailingAddresses_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            // ********** code referenced from https://weblogs.asp.net/joseguay/having-radiobuttons-on-a-repeater-or-datalist
            // following reference code runs a script that adds onlick event to each radio button, ensuring that their 
            // group is properly set up
            // this is necessary due the the radio buttons being inside a data repeater
            if (e.Item.ItemType != ListItemType.Item && e.Item.ItemType != ListItemType.AlternatingItem) return;

            RadioButton rButton = (RadioButton)e.Item.FindControl("radioButton");

            string script = "SetUniqueRadioButton('repeaterMailingAddresses.*MailingAddresses',this)";

            rButton.Attributes.Add("OnClick", script);
            // ********** end reference

            // folowing code displays unit no if it exists
            // also selects the radio button for the default address
            // grab session userID
            BL.User usrSession = (BL.User)Session["User"];
            int intUserID = (int)usrSession.UserID;
            // find row view
            DataRowView rowView = (DataRowView)e.Item.DataItem;
            // find unitNo label
            Label labelUnitNo = (Label)e.Item.FindControl("lblUnitNo");
            // display unit no if it exists
            if (rowView["UnitNo"].ToString() != "")
            {
                labelUnitNo.Visible = true;
                labelUnitNo.Text = rowView["UnitNo"].ToString() + ", ";
            }

            // selected if this address is the default
            if ((bool)rowView["IsDefault"])
                rButton.Checked = true;
        }

        protected void repeaterBillingAddresses_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            // ********** code referenced from https://weblogs.asp.net/joseguay/having-radiobuttons-on-a-repeater-or-datalist
            // following reference code runs a script that adds onlick event to each radio button, ensuring that their 
            // group is properly set up
            // this is necessary due the the radio buttons being inside a data repeater
            if (e.Item.ItemType != ListItemType.Item && e.Item.ItemType != ListItemType.AlternatingItem) return;

            RadioButton rButton = (RadioButton)e.Item.FindControl("radioButton");

            string script = "SetUniqueRadioButton('repeaterBillingAddresses.*BillingAddresses',this)";

            rButton.Attributes.Add("OnClick", script);
            // ********** end reference

            // folowing code displays unit no if it exists
            // also selects the radio button for the default address
            // grab session userID
            BL.User usrSession = (BL.User)Session["User"];
            int intUserID = (int)usrSession.UserID;
            // find row view
            DataRowView rowView = (DataRowView)e.Item.DataItem;
            // find unitNo label
            Label labelUnitNo = (Label)e.Item.FindControl("lblUnitNo");
            // display unit no if it exists
            if (rowView["UnitNo"].ToString() != "")
            {
                labelUnitNo.Visible = true;
                labelUnitNo.Text = rowView["UnitNo"].ToString() + ", ";
            }

            // selected if this address is the default
            if ((bool)rowView["IsDefault"])
                rButton.Checked = true;
        }

        protected void btnAddBillingAddress_Click(object sender, EventArgs e)
        {
            string url = ConfigurationManager.AppSettings["SecurePath"] + "checkoutAddAddress.aspx?ID=billing";
            Response.Redirect(url);
        }

        protected void btnAddMailingAddress_Click(object sender, EventArgs e)
        {
            string url = ConfigurationManager.AppSettings["SecurePath"] + "checkoutAddAddress.aspx?ID=mailing";
            Response.Redirect(url);
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
                    System.Web.UI.WebControls.Image image = (System.Web.UI.WebControls.Image)e.Item.FindControl("imgProductImage");
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

        private static bool boolCheckStockLevelsAndPrePurchaseItems(int _intUserID)
        {
            // the 'pre' condition before making a purchase - stock levels are checked and reduced
            // if the purchase fails, they should be reset by purchaseFailure()
            return BL.BLCheckout.boolCheckStockLevelsAndReduceStockLevels(_intUserID);
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            try
            {
                // session variable
                var usrSession = (BL.User)Session["User"];
                int intUserID = (int)usrSession.UserID;
                // grab costs
                decimal decPostageCost = 0.00m;
                if (rbtnPostageOptions.SelectedValue == "Express")
                    decPostageCost = 30.00m;
                if (rbtnPostageOptions.SelectedValue == "Regular")
                    decPostageCost = 20.00m;

                decimal decItemCost = BL.BLCart.decCartTotalPrice(intUserID);
                decimal decTotalCost = decPostageCost + decItemCost;
                // grab addresseIDs
                int intBillingAddressID = 1002;
                int intMailingAddressID = 1002;
                // grab selected radiobutton's address ID
                foreach (RepeaterItem item in repeaterBillingAddresses.Items)
                {
                    RadioButton rBtn = (RadioButton)item.FindControl("radioButton");
                    if (rBtn.Checked)
                    {
                        Label label = (Label)item.FindControl("lblAddressID");
                        intBillingAddressID = Convert.ToInt32(label.Text);
                        System.Diagnostics.Debug.WriteLine(intBillingAddressID);
                        break;
                    }
                }
                foreach (RepeaterItem item in repeaterMailingAddresses.Items)
                {
                    RadioButton rBtn = (RadioButton)item.FindControl("radioButton");
                    if (rBtn.Checked)
                    {
                        Label label = (Label)item.FindControl("lblAddressID");
                        intMailingAddressID = Convert.ToInt32(label.Text);
                        System.Diagnostics.Debug.WriteLine(intMailingAddressID);
                        break;
                    }
                }

                bool boolPrePurchase = boolCheckStockLevelsAndPrePurchaseItems(intUserID);

                if (boolPrePurchase)
                {
                    lblPaymentFeedback.Text = "Processing payment...";
                    lblPaymentFeedback.Visible = true;

                    // grab controls
                    /*
                    string strCardNO = tbxCardNumber.Text.ToString();
                    string strCardName = tbxName.Text.ToString();
                    int intExpMonth = Convert.ToInt32(tbxExpMonth.Text);
                    int intExpYear = Convert.ToInt32(tbxExpYear.Text);
                    int intCVC = Convert.ToInt32(tbxCVC.Text);
                    
                    //DateTime dateTimeExpiry = new DateTime(intExpYear, intExpMonth, 1);
                    //string strDescription = "This is a description";

                    // payment system - not actually implemented
                    //IPaymentSystem paymentSystem = INFT3050PaymentFactory.Create();
                    //PaymentRequest payment = new PaymentRequest();

                    // payment
                    
                    payment.CardNumber = strCardNO;
                    payment.CardName = strCardName;
                    payment.Expiry = dateTimeExpriy;
                    payment.CVC = intCVC;
                    payment.Amount = decTotalCost;
                    payment.Description = strDescription;
                    */

                    // simulate purchase - this bypasses the payment system. not entirely sure how to use async etc
                    bool boolPurchaseCompleted = true;

                    if (boolPurchaseCompleted)
                    {
                        int intInvoiceID = BL.BLCheckout.intMakePurchaseReturnID(
                            intBillingAddressID, intMailingAddressID, decTotalCost, decPostageCost, intUserID);

                        // deactivate cart
                        BL.BLCheckout.deactivateCart(intUserID);

                        string url = ConfigurationManager.AppSettings["UnsecurePath"] + "checkoutConfirmation.aspx?ID=" + intInvoiceID;
                        Response.Redirect(url);
                    } else
                    {
                        BL.BLCheckout.purchaseFailure(intUserID);
                    }

                    /*
                    if (receipt.TransactionResult.ToString() == "Approved")
                    {
                        Response.Redirect("checkoutConfirmation.aspx");
                    }*/

                    //if (task.IsCompleted)
                    //{
                    //    lblPaymentFeedback.Text += "Hello";
                    //    lblPaymentFeedback.Text += task.Result.ToString();
                    //    // Response.Redirect("checkoutConfirmation.aspx");
                    //
                } 
                else // else atleast one of the items stock level was not high enough
                {
                    lblPaymentFeedback.Text = "Sorry, one of those items doesn't have enough stock! Edit your cart";
                }
            }
            catch
            {
                lblPaymentFeedback.Text = "There was an error processing your request, payment cancelled.";
                lblPaymentFeedback.ForeColor = Color.Red;
            }
        }

        protected void button_Click(object sender, EventArgs e)
        {
            int intBillingAddressID;
            int intMailingAddressID;
            foreach (RepeaterItem item in repeaterBillingAddresses.Items)
            {
                RadioButton rBtn = (RadioButton)item.FindControl("radioButton");
                System.Diagnostics.Debug.WriteLine("loop");
                if (rBtn.Checked)
                {
                    Label label = (Label)item.FindControl("lblAddressID");
                    intBillingAddressID = Convert.ToInt32(label.Text);
                    System.Diagnostics.Debug.WriteLine(intBillingAddressID);
                    break;
                }
            }
            foreach (RepeaterItem item in repeaterMailingAddresses.Items)
            {
                RadioButton rBtn = (RadioButton)item.FindControl("radioButton");
                if (rBtn.Checked)
                {
                    Label label = (Label)item.FindControl("lblAddressID");
                    intMailingAddressID = Convert.ToInt32(label.Text);
                    System.Diagnostics.Debug.WriteLine(intMailingAddressID);
                    break;
                }
            }
        }
    }
}