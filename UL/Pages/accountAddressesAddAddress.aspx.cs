using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PandemicSuppliesWebApp.UL.Pages {
    public partial class accountAddressesAddAddress : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsSecureConnection)
            {
                string url = ConfigurationManager.AppSettings["SecurePath"] + "accountAddAddresses.aspx";
                Response.Redirect(url);
            }
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

                if (cbxBillingAddress.Checked)
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
            string url = ConfigurationManager.AppSettings["UnsecurePath"] + "accountAddresses.aspx";
            Response.Redirect(url);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("account.aspx");
        }
    }
}