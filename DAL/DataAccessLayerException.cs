using System;
using System.Runtime.Serialization;

namespace PandemicSuppliesWebApp.DAL {
    [Serializable]
    public class DataAccessLayerException : Exception {
        public DataAccessLayerException() 
            : base()
        {
            System.Diagnostics.Debug.WriteLine("Data Access Layer Exception");
            Console.WriteLine("Data Access Layer Exception");
        }
    }
}