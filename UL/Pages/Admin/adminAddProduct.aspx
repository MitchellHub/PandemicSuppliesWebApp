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

    <asp:Label runat="server" ID="lblStockLevel" Text="StockLevel: " /><asp:TextBox runat="server" ID="tbxStockLevel" Text="" Width="500" TextMode="Number"/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter a stock level" ControlToValidate="tbxStockLevel" CssClass="input-error_message"></asp:RequiredFieldValidator><br /><br />

    <asp:Label runat="server" ID="lblImgSource" Text="Img Source: " /><asp:TextBox runat="server" ID="tbxImgSource" Text="" Width="500"/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please enter an image source" ControlToValidate="tbxImgSource" CssClass="input-error_message"></asp:RequiredFieldValidator><br /><br />

    <asp:Label runat="server" ID="lblIsActive" Text="Active: " /><asp:CheckBox runat="server" ID="cbxIsActive" /><br /><br />

    <asp:Button runat="server" ID="btnAdd" Text="Add product" OnClick="btnAdd_Click" CausesValidation="True"/>

    <asp:Button runat="server" ID="btnCancel" Text="Cancel" OnClick="btnCancel_Click"/>

    <asp:Label runat="server" ID="lblFeedback" Text="" />
</asp:Content>
