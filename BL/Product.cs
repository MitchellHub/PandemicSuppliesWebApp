using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PandemicSuppliesWebApp.BL {
    public class Product {
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public string ProductDesc { get; set; }
        public decimal ProductPrice { get; set; }
        public int StockLevel { get; set; }
        public byte[] ProductImage { get; set; }
        public bool IsActive { get; set; }
    }
}