<%@ Page Title="" Language="C#" MasterPageFile="~/UL/PagesMaster/Site1.Master" AutoEventWireup="true" CodeBehind="registerSuccess.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.registerSuccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h1 style="text-align: center; padding-top: 2rem;">
        <asp:HyperLink ID="linkLogo" runat="server" NavigateUrl="~/UL/Pages/main.aspx" Text="Pandemic Supplies" CssClass="nav-link nav-logo" ForeColor="Black" />
    </h1>
    <div class="grid-wrapper-login">
        <div class="grid-item"></div>
        <div class="grid-item grid-item-logincard">
            <br />
            <br />
            <br />
            <h1>Success!</h1>
            <br />
            <br />
            <span class="input-helper_text">
                <asp:HyperLink ID="linkLogin" runat="server" Text="Click here to Login" NavigateUrl="~/UL/Pages/login.aspx" />
            </span>
        </div>
        <div class="grid-item"></div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
