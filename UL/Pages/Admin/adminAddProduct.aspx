<%@ Page Title="" Language="C#" MasterPageFile="~/UL/Pages/Admin/Site1Admin.Master" AutoEventWireup="true" CodeBehind="adminAddProduct.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.Admin.adminAddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h2>Add Product</h2>
    <hr />
    <br />
    <asp:Label runat="server" ID="lblProductName" Text="ProductName: " /><asp:TextBox runat="server" ID="tbxProductName" Text="" Width="500"/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter a product name" ControlToValidate="tbxProductName" CssClass="input-error_message"></asp:RequiredFieldValidator><br /><br />

    <asp:Label runat="server" ID="lblProductDesc" Text="ProductDesc: "/><asp:TextBox runat="server" ID="tbxProductDesc" Text="" Width="500" Rows="5" TextMode="MultiLine"/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter a product description" ControlToValidate="tbxProductDesc" CssClass="input-error_message"></asp:RequiredFieldValidator><br /><br />

    <asp:Label runat="server" ID="lblProductPrice" Text="ProductPrice: " /><asp:TextBox runat="server" ID="tbxProductPrice" Width="500" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter a product price" ControlToValidate="tbxProductPrice" CssClass="input-error_message"></asp:RequiredFieldValidator><br /><br />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" 
        runat="server" 
        ErrorMessage="Price must be a number with two decimal places" 
        ControlToValidate="tbxProductPrice" 
        ValidationGroup="ProductValidation" 
        Display="Dynamic" 
        CssClass="input-error_message" 
        ValidationExpression="(\d+\.\d{1,2})" />

    <asp:Label runat="server" ID="lblStockLevel" Text="StockLevel: " /><asp:TextBox runat="server" ID="tbxStockLevel" Text="" Width="500"/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter a stock level" ControlToValidate="tbxStockLevel" CssClass="input-error_message"></asp:RequiredFieldValidator><br /><br />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" 
        runat="server" 
        ErrorMessage="Stock Level must be a positive number" 
        ControlToValidate="tbxStockLevel" 
        ValidationGroup="ProductValidation" 
        Display="Dynamic" 
        CssClass="input-error_message" 
        ValidationExpression="^[0-9]\d*$" />

    <asp:Label runat="server" ID="lblImgSource" Text="Select an Image to upload: " />
    <asp:FileUpload ID="fupImage" runat="server" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Must select an image" ControlToValidate="fupImage" CssClass="input-error_message"></asp:RequiredFieldValidator><br /><br />

    <asp:Label runat="server" ID="lblIsActive" Text="Active: " /><asp:CheckBox runat="server" ID="cbxIsActive" /><br /><br />

    <asp:Button runat="server" ID="btnAdd" Text="Add product" OnClick="btnAdd_Click" CausesValidation="true"/>
    <asp:Button runat="server" ID="btnCancel" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="false"/>
    <br />
    <asp:Label runat="server" ID="lblFeedback" Text="" />
    <br />
    <asp:Label ID="lblImgFeedback" runat="server"></asp:Label>

</asp:Content>
