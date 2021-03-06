﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;

namespace PandemicSuppliesWebApp.DAL {
    public class DALBillingAddressAccess {
        public static DataTable dtbSelectBillingAddresses(int _intUserID)
            // method returns datatable of all billingaddresses by userID
        {
            var dtbReturn = new DataTable();
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);

            SqlCommand cmdSelectAddresses = new SqlCommand("BillingAddresses_UspSelectBillingAddresses", conn);
            cmdSelectAddresses.CommandType = CommandType.StoredProcedure;
            cmdSelectAddresses.Parameters.Add(new SqlParameter("@UserID", _intUserID));

            try
            {
                conn.Open();
                using (SqlDataAdapter da = new SqlDataAdapter(cmdSelectAddresses))
                {
                    da.Fill(dtbReturn);
                    System.Diagnostics.Debug.WriteLine("fill with addresses");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.ToString());
                throw new DataAccessLayerException();
            }
            return dtbReturn;
        }

        public static void insertBillingAddress(int _intUserID, bool _boolIsDefault, string _strName, int _intUnitNo, int _intStreetNo, string _strStreet, string _strSuburb, int _intPostCode, string _strState, int _intPhone)
        {
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);

            var cmdInsertAddress = new SqlCommand("BillingAddresses_UspInsertBillingAddress", conn);
            cmdInsertAddress.CommandType = CommandType.StoredProcedure;
            
            // parameters
            SqlParameter[] parameters = new SqlParameter[] {
                new SqlParameter("@UserID", _intUserID),
                new SqlParameter("@IsDefault", _boolIsDefault),
                new SqlParameter("@Name", _strName),
                new SqlParameter("@UnitNo", _intUnitNo),
                new SqlParameter("@StreetNo", _intStreetNo),
                new SqlParameter("@Street", _strStreet),
                new SqlParameter("@Suburb", _strSuburb),
                new SqlParameter("@PostCode", _intPostCode),
                new SqlParameter("@State", _strState),
                new SqlParameter("@Phone", _intPhone)
            };
            cmdInsertAddress.Parameters.AddRange(parameters);

            try
            {
                conn.Open();
                cmdInsertAddress.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.ToString());
                throw new DataAccessLayerException();
            }
        }

        public static void updateBillingAddressDefaults(int _intUserID)
            // sets all addresses IsDefault = false for a userID
        {
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);

            var cmdUpdateDefaults = new SqlCommand("BillingAddresses_UspUpdateBillingAddressDefaults", conn);
            cmdUpdateDefaults.CommandType = CommandType.StoredProcedure;

            cmdUpdateDefaults.Parameters.Add(new SqlParameter("@UserID", _intUserID));

            try
            {
                conn.Open();
                cmdUpdateDefaults.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.ToString());
                System.Diagnostics.Debug.WriteLine("DAL exception");
            }
        }

        public static void updateBillingAddressIsActive(int _intAddressID, bool _boolIsActive)
        {
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);

            var cmdUpdateIsActive = new SqlCommand("BillingAddresses_UspUpdateIsActive", conn);
            cmdUpdateIsActive.CommandType = CommandType.StoredProcedure;

            cmdUpdateIsActive.Parameters.Add(new SqlParameter("@BillingAddressID", _intAddressID));
            cmdUpdateIsActive.Parameters.Add(new SqlParameter("@IsActive", _boolIsActive));

            try
            {
                conn.Open();
                cmdUpdateIsActive.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.ToString());
                System.Diagnostics.Debug.WriteLine("DAL exception");
            }
        }

        public static void updateBillingAddressIsDefault(int _intAddressID)
        {
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["INFT3050ConnectionString"].ConnectionString);

            var cmdUpdateIsDefault = new SqlCommand("BillingAddress_UspUpdateIsDefault", conn);
            cmdUpdateIsDefault.CommandType = CommandType.StoredProcedure;

            cmdUpdateIsDefault.Parameters.Add(new SqlParameter("@BillingAddressID", _intAddressID));

            try
            {
                conn.Open();
                cmdUpdateIsDefault.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.ToString());
                System.Diagnostics.Debug.WriteLine("DAL exception");
            }
        }
    }
}