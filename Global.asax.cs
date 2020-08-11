using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace PandemicSuppliesWebApp
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            RouteConfig.RegisterRoutes(RouteTable.Routes);  // enable friendly urls
        }
        //protected void Application_Error(object sender, EventArgs e)
        //{
        //    Response.Redirect("error.aspx");
        //}
    }
}