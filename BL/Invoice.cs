using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PandemicSuppliesWebApp.BL
{
    public class Invoice
    {
        public int InvoiceID { get; set; }
        public int BillingAddressID { get; set; }
        public int MailingAddressID { get; set; }
        public int UserID { get; set; }
        public string CreateDate { get; set; }
        public float InvoiceTotal { get; set; }
        public float PostageCost { get; set; }
    }
}