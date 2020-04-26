using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PandemicSuppliesWebApp.UL.Pages
{
    public partial class search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strSearch = Request.QueryString["Search"].ToString();

            lblSearchFeedback.Text = "Searching for: " + strSearch;

            StringBuilder strProductsHTML = new StringBuilder();

            //for ()
            //    strProductsHTML.Append();


        }
    }
}