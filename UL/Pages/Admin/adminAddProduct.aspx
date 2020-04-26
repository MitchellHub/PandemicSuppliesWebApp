<%@ Page Title="" Language="C#" MasterPageFile="~/UL/Pages/Admin/Site1Admin.Master" AutoEventWireup="true" CodeBehind="adminAddProduct.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.Admin.adminAddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h2>Add Product</h2>
    <hr />
    <br />
    <asp:Label runat="server" ID="lblProductName" Text="ProductName: " /><asp:TextBox runat="server" ID="tbxProductName" Text="" Width="500"/><br /><br />

    <asp:Label runat="server" ID="lblProductDesc" Text="ProductDesc: "/><asp:TextBox runat="server" ID="tbxProductDesc" Text="" Width="500"/><br /><br />

    <asp:Label runat="server" ID="lblProductPrice" Text="ProductPrice: " /><asp:TextBox runat="server" ID="tbxProductPrice" Text="" Width="500"/><br /><br />

    <asp:Label runat="server" ID="lblStockLevel" Text="StockLevel: " /><asp:TextBox runat="server" ID="tbxStockLevel" Text="" Width="500"/><br /><br />

    <asp:Label runat="server" ID="lblImgSource" Text="Img Source: " /><asp:TextBox runat="server" ID="tbxImgSource" Text="" Width="500"/><br /><br />

    <asp:Label runat="server" ID="lblIsActive" Text="Active: " /><asp:CheckBox runat="server" ID="cbxIsActive" /><br /><br />

    <asp:Button runat="server" ID="btnAdd" Text="Add product" OnClick="btnAdd_Click"/>

    <asp:Button runat="server" ID="btnCancel" Text="Cancel" OnClick="btnCancel_Click"/>
</asp:Content>
