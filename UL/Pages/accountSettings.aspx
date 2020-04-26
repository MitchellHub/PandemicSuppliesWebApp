<%@ Page Title="" Language="C#" MasterPageFile="~/UL/PagesMaster/Site1Footer.master" AutoEventWireup="true" CodeBehind="accountSettings.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.accountSettings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <p><asp:HyperLink runat="server" Text="Your Account" NavigateUrl="~/UL/Pages/account.aspx"/> > Login & Security</p>
    <h1>Login & Security</h1>
    <br />
    <div class="border_rounded padding-1">
        <asp:Label runat="server" Text="Name: " CssClass="bold"/><asp:Button runat="server" ID="btnName" Text="Edit" CssClass="button float-right" />
        <br />
        <asp:Label runat="server" ID="tbxName" Text="SpongeBob Squarepants"/>
        <hr class="hr-margin" />

        <asp:Label runat="server" Text="Email: " CssClass="bold"/><asp:Button runat="server" ID="btnEmail" Text="Edit" CssClass="button float-right" />
        <br />
        <asp:Label runat="server" ID="lblEmail" Text="email@email.com"/>
        <hr class="hr-margin" />

        <asp:Label runat="server" Text="Phone Number: " CssClass="bold"/><asp:Button runat="server" ID="btnPhone" Text="Edit" CssClass="button float-right" />
        <br />
        <asp:Label runat="server" ID="lblPhone" Text="0490 333 222"/>
        <hr class="hr-margin" />

        <asp:Label runat="server" Text="Password: " CssClass="bold"/><asp:Button runat="server" ID="btnPassword" Text="Reset" CssClass="button float-right" OnClick="btnPassword_Click"/>
        <br />
        <asp:Label runat="server" ID="lblPassword" Text="********"/>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
