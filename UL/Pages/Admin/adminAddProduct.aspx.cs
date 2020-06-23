using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PandemicSuppliesWebApp.UL.Pages.Admin
{
    public partial class adminAddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminDashboard.aspx");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
            // method sends product info to lower layers
        {
            string strProdName = tbxProductName.Text.ToString();
            string strProdDesc = tbxProductDesc.Text.ToString();
            string strProductPrice = tbxProductPrice.Text;
            string intStockLevel = tbxStockLevel.Text;
            bool boolIsActive = cbxIsActive.Checked;
            // string strImgSource = "test";
            if (fupImage.HasFile) 
            {
                int intImgFileLength = fupImage.PostedFile.ContentLength;
                byte[] bytImageArray = new byte[intImgFileLength];
                HttpPostedFile imageProductImage = fupImage.PostedFile;
                imageProductImage.InputStream.Read(bytImageArray, 0, intImgFileLength);

                //int intReturnID = BL.BLAdminAddProduct.addProductReturnID(strProdName, strProdDesc, strProductPrice, intStockLevel, boolIsActive, strImgSource);
                int intReturnID = BL.BLAdminAddProduct.addProductReturnID(strProdName, strProdDesc, strProductPrice, intStockLevel, boolIsActive, bytImageArray);
                if (intReturnID > 0)
                    lblFeedback.Text = "Successfully added the product to database with ID: " + intReturnID;
                else if (intReturnID == -1)
                    lblFeedback.Text = "Invalid input data.";
                else
                    lblFeedback.Text = "There was a problem communicating with the server.";
            }
            else
            {
                lblFeedback.Text = "Error uploading image file.";
            }

            
        }

        /*
        private bool grabImage()
        {
            string strFileName;
            string strFilePath;
            string strFolder;
            strFolder = Server.MapPath("../IMG/");

            bool boolReturn = false;
            try
            {
                // retrieve filename
                strFileName = inpImage.PostedFile.FileName;
                strFileName = Path.GetFileName(strFileName);

                // create dir
                if (!Directory.Exists(strFolder))
                {
                    Directory.CreateDirectory(strFolder);
                }

                // save file
                strFilePath = strFolder + strFileName;

                if (File.Exists(strFilePath))
                {
                    lblImgFeedback.Text = strFileName + "already exists on the server!";
                    boolReturn = false;
                }
                else
                {
                    lblImgFeedback.Text = strFileName + "Successfully uploaded.";
                    boolReturn = true;
                }
                
            }
            catch
            {
                lblImgFeedback.Text = "Failed to uploaded";
                boolReturn = false;
            }
            finally
            {
                lblImgFeedback.Visible = true;
            }
            return boolReturn;
        }
        */
    }
}