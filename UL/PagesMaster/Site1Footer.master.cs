using PandemicSuppliesWebApp.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PandemicSuppliesWebApp.UL.PagesMaster
{
    public partial class Site1Footer : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // following code makes btnSearch the 'DefaultButton' of the page, ensuring that pressing enter fires btnSearch
            ContentPlaceHolder cph = (ContentPlaceHolder)Master.FindControl("body");
            LinkButton btnSearch = cph.FindControl("btnSearch") as LinkButton;
            cph.Page.Form.DefaultButton = btnSearch.UniqueID;

            // grab the session variable
            BL.User usrSession = (BL.User) Session["User"];

            // set card number
            

            if (usrSession != null)     // if user is logged in
            {
                if (usrSession.IsAdmin == true)  // if user is admin, log them out - they shouldn't be in customer site
                    Response.Redirect("~/UL/Pages/logOut.aspx");

                else
                {
                    linkAccount.Text = "Hi, " + usrSession.Name.ToString();
                    linkOrders.NavigateUrl = "~/UL/Pages/orders.aspx";
                    linkAccount.NavigateUrl = "~/UL/Pages/account.aspx";

                    // set cart number
                    try
                    {
                        int intCartStock = (int) BL.BLCart.intCartTotalProducts(usrSession.UserID);
                        if (intCartStock > 0)
                            lblCartStock.Text = intCartStock.ToString();
                        else
                            lblCartStock.Text = "";
                    }
                    catch (Exception ex)
                    {
                        lblCartStock.Text = "";
                    }
                }
            } 
            else                                // if user is not logged in/user session == null
            {
                linkAccount.Text = "Login";
                lblCartStock.Text = "";
                linkAccount.NavigateUrl = "~/UL/Pages/login.aspx";
                linkOrders.NavigateUrl = "~/UL/Pages/login.aspx";
            }

            
        }
        protected void linkCart_Click(object sender, EventArgs e)
        {
            // users should be able to add items to a cart without making an account,
            // but for now redirect to login page

            if (Session["User"] != null)
                Response.Redirect("~/UL/Pages/cart.aspx");
            else
                Response.Redirect("~/UL/Pages/login.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (tbxSearch.Text == "")
                Response.Redirect("~/UL/Pages/main.aspx");
            else
                Response.Redirect("~/UL/Pages/search.aspx?Search=" + tbxSearch.Text);
        }
    }
}