<%@ Page Title="" Language="C#" MasterPageFile="~/UL/Pages/Admin/Site1Admin.Master" AutoEventWireup="true" CodeBehind="adminDashboard.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.Admin.adminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <br />
    <ul>
        <li><asp:HyperLink ID="HyperLink1" runat="server" Text="View User Accounts" NavigateUrl="~/UL/Pages/Admin/adminAccounts.aspx"/></li><br />
        
        <li><asp:HyperLink ID="HyperLink2" runat="server" Text="View Products" NavigateUrl="~/UL/Pages/Admin/adminProducts.aspx"/></li><br />
        
        <li><asp:HyperLink ID="HyperLink3" runat="server" Text="Add Product" NavigateUrl="~/UL/Pages/Admin/adminAddProduct.aspx"/></li><br />

        <li><asp:HyperLink ID="HyperLink4" runat="server" Text="Log Out" NavigateUrl="~/UL/Pages/logOut.aspx"/></li><br />
    </ul>
</asp:Content>