using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PandemicSuppliesWebApp.UL.Pages {
    public partial class checkoutAddAddress : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e)
        {
            // redirect with tried to access without secure connection
            // (should only be accessed through main checkout page)
            if (!Request.IsSecureConnection)
            {
                string url = ConfigurationManager.AppSettings["SecurePath"] + "checkoutPayment.aspx";
                Response.Redirect(url);
            }

            // grab argument from url
            string strArgument = (string)(Request["ID"]);
            if (strArgument == "billing")
                lblHeading.Text = "Add Billing Address";
            if (strArgument == "mailing")
                lblHeading.Text = "Add Mailing Address";
        }

        protected void btnAddAddress_Click(object sender, EventArgs e)
        {
            try
            {
                // get user session
                var usrSession = (BL.User)Session["User"];
                // get control values
                string strName = tbxName.Text.ToString();
                int intPhoneNo = Convert.ToInt32(tbxPhoneNumber.Text);

                int intUnitNo = 0;
                if (tbxUnitNo.Text.ToString() != "")
                    intUnitNo = Convert.ToInt32(tbxUnitNo.Text);

                int intStreetNo = Convert.ToInt32(tbxStreetNo.Text);
                string strStreet = tbxStreet.Text.ToString();
                string strSuburb = tbxSuburb.Text.ToString();
                int intPostCode = Convert.ToInt32(tbxPostCode.Text);
                string strState = listStates.SelectedValue.ToString();

                bool boolIsDefault = cbxDefaultAddress.Checked;

                // grab argument from url
                string strArgument = (string)(Request["ID"]);

                if (strArgument == "billing")
                {
                    BL.BLAccountAddresses.insertBillingAddress(
                        Convert.ToInt32(usrSession.UserID),
                        boolIsDefault,
                        strName,
                        intUnitNo,
                        intStreetNo,
                        strStreet,
                        strSuburb,
                        intPostCode,
                        strState,
                        intPhoneNo);
                } 
                else
                {
                    BL.BLAccountAddresses.insertMailingAddress(
                        Convert.ToInt32(usrSession.UserID),
                        boolIsDefault,
                        strName,
                        intUnitNo,
                        intStreetNo,
                        strStreet,
                        strSuburb,
                        intPostCode,
                        strState,
                        intPhoneNo);
                }
            }
            catch
            {
                string url2 = ConfigurationManager.AppSettings["UnsecurePath"] + "error.aspx";
                Response.Redirect(url2);
            }
            string url = ConfigurationManager.AppSettings["SecurePath"] + "checkoutPayment.aspx";
            Response.Redirect(url);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            string url = ConfigurationManager.AppSettings["SecurePath"] + "checkoutPayment.aspx";
            Response.Redirect(url);
        }
    }
}