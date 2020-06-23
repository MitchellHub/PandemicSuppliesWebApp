using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PandemicSuppliesWebApp.UL.Pages
{
    public partial class checkoutPayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnAddDeliveryAddress_Click(object sender, EventArgs e)
        {
            Response.Redirect("checkoutAddDeliveryAddress.aspx");
        }
        protected void btnAddBillingAddress_Click(object sender, EventArgs e)
        {
            Response.Redirect("checkoutAddBillingAddress.aspx");
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            string strCardNO = tbxCardNumber.Text.ToString();
            string strCardName = tbxName.Text.ToString();
            int intExpMonth = Convert.ToInt32(tbxExpMonth.Text);
            int intExpYear = Convert.ToInt32(tbxExpYear.Text);
            int intCVC = Convert.ToInt32(tbxCVC.Text);

            DateTime dateTimeExpriy = new DateTime(intExpYear, intExpMonth, 1);
            Decimal decSaleTotal = 10.00m;
            string strDescription = "This is a description";


            INFT3050.PaymentSystem.PaymentRequest payment = new INFT3050.PaymentSystem.PaymentRequest();
            payment.CardNumber = strCardNO;
            payment.CardName = strCardName;
            payment.Expiry = dateTimeExpriy;
            payment.CVC = intCVC;
            payment.Amount = decSaleTotal;
            payment.Description = strDescription;

            lblPaymentFeedback.Text = "Processing payment...";
            lblPaymentFeedback.Visible = true;

            INFT3050.PaymentSystem.INFT3050PaymentSystem paymentSystem = new INFT3050.PaymentSystem.INFT3050PaymentSystem();
            INFT3050.PaymentSystem.PaymentResult receipt = paymentSystem.MakePayment(payment).Result;

            if(receipt.TransactionResult.ToString() == "Approved")
            {
                lblPaymentFeedback.Text = "Payment Success";
                Response.Redirect("checkoutConfirmation.aspx");
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            // pressing remove will not redirect user, but will remove item from cart
            // for now, just disabling the mask item
            divFirstProduct.Visible = false;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("cart.aspx");
        }
    }
}