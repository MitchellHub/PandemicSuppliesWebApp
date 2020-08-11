using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PandemicSuppliesWebApp.UL.Pages
{
    public partial class accountSettings : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsSecureConnection)
            {
                string url = ConfigurationManager.AppSettings["SecurePath"] + "accountSettings.aspx";
                Response.Redirect(url);
            }
            if (!IsPostBack)
            {
                try
                {
                    // grab user session
                    var usrSession = (BL.User)Session["User"];
                    // double check we're logged in
                    if (usrSession == null)
                        Response.Redirect("login.aspx");

                    // grab data table
                    DataTable dtbUserInfo = BL.BLAccountSettings.dtbSelectUserInfo((int)usrSession.UserID);
                    // grab row for simplicity
                    DataRow drwUserInfo = dtbUserInfo.Rows[0];
                    // assign html values
                    fillWithUserInfo(drwUserInfo);
                }
                catch (DAL.DataAccessLayerException)
                {
                    Response.Redirect("error.aspx?ID=dataaccess");
                }
                catch (BL.BusinessLayerException)
                {
                    Response.Redirect("error.aspx");
                }
                catch
                {
                    Response.Redirect("error.aspx");
                }
            }
        }


        protected void btnPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("resetPassword.aspx");
        }

        private void fillWithUserInfo(DataRow _drwUserInfo)
        {
            lblName.Text = (string)_drwUserInfo["FirstName"];

            lblEmail.Text = (string)_drwUserInfo["Email"];
        }

        protected void btnName_Click(object sender, EventArgs e)
        {
            lblName.Visible = false;
            tbxName.Visible = true;
            tbxName.Text = lblName.Text.ToString();

            btnConfirmName.Visible = true;
        }
        protected void btnConfirmName_Click(object sender, EventArgs e)
        {
            try
            {
                // grab user session
                var usrSession = (BL.User)Session["User"];
                // double check we're logged in
                if (usrSession == null)
                    Response.Redirect("login.aspx");

                // grab new name
                string strNewName = tbxName.Text.ToString();
                // query db 
                BL.BLAccountSettings.updateName(strNewName, (int)usrSession.UserID);
                // reset user name (this is probably not the best way to do it,
                // in future i will not use an object as session variable
                usrSession.Name = strNewName;
                Session["User"] = usrSession;

                // reset labels
                lblName.Visible = true;
                tbxName.Visible = false;
                lblName.Text = tbxName.Text;
                btnConfirmName.Visible = false;
            }
            catch (DAL.DataAccessLayerException)
            {
                Response.Redirect("error.aspx?ID=dataaccess");
            }
            catch (BL.BusinessLayerException)
            {
                Response.Redirect("error.aspx");
            }
            catch
            {
                Response.Redirect("error.aspx");
            }
            // refresh page
            string url = ConfigurationManager.AppSettings["SecurePath"] + "accountSettings.aspx";
            Response.Redirect(url);
        }

        protected void btnEmail_Click(object sender, EventArgs e)
        {

        }

        protected void btnConfirmEmail_Click(object sender, EventArgs e)
        {

        }
    }
}