﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PandemicSuppliesWebApp.UL.Pages
{
    public partial class main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strUserID = Convert.ToString(Session["User_ID"]);

            if (strUserID == "1")
            {

            }
            else
            {
                // error page
                // "you need to login first to access this page"
            }
        }
    }
}