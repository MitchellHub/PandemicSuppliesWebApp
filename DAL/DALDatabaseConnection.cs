using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PandemicSuppliesWebApp.DAL
{
    public class DALDatabaseConnection
    {
        public static SqlConnection INFT3050Connection()
        {
            return new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);
        }
    }
}