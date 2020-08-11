using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PandemicSuppliesWebApp.BL {
    public class BusinessLayerException : Exception {
        public BusinessLayerException() 
            : base()
        {
            System.Diagnostics.Debug.WriteLine("Business Layer Exception");
        }
    }
}