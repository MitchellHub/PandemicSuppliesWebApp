<%@ Page Title="" Language="C#" MasterPageFile="~/UL/PagesMaster/Site1Footer.Master" AutoEventWireup="true" CodeBehind="account.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h1>Your Account</h1>
    <br />
    <asp:LinkButton runat="server" ID="btnOrders" Text="Your Orders" OnClick="btnOrders_Click" />
    <br />
    <br />
    <asp:LinkButton runat="server" ID="btnAccountSettings" Text="Login & Security" OnClick="btnAccountSettings_Click" />
    <br />
    <br />
    <asp:LinkButton runat="server" ID="btnAddresses" Text="Your Addresses" OnClick="btnAddresses_Click"/>
    <br />
    <br />
    <asp:LinkButton runat="server" ID="btnLogout" Text="Log Out" OnClick="btnLogout_Click"/>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
