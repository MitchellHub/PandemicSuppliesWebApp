<%@ Page Title="" Language="C#" MasterPageFile="~/UL/Pages/Admin/Site1Admin.Master" AutoEventWireup="true" CodeBehind="adminDashboard.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.Admin.adminDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Administration Dashboard</h1>
    <hr />
    <br />
    <ul>
        <li><asp:HyperLink ID="HyperLink1" runat="server" Text="Edit User Accounts" NavigateUrl="~/UL/Pages/Admin/adminAccounts.aspx"/></li><br />
        <li><asp:HyperLink ID="HyperLink2" runat="server" Text="Edit Products" NavigateUrl="~/UL/Pages/Admin/adminProducts.aspx"/></li>
    </ul>
</asp:Content>
