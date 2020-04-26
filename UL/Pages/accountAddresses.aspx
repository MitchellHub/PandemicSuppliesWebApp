<%@ Page Title="" Language="C#" MasterPageFile="~/UL/PagesMaster/Site1Footer.master" AutoEventWireup="true" CodeBehind="accountAddresses.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.accountAddresses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <p><asp:HyperLink runat="server" Text="Your Account" NavigateUrl="~/UL/Pages/account.aspx"/> > Your Addresses</p>
    <h1>Your Addresses</h1>
    <br />
    <div class="border_rounded padding-1">
        <%-- Label will be generated, so no IDs --%>
        <%-- Not sure how to make unique events here though, so no events --%>
        <asp:Label runat="server" Text="Spongebob Squarepants, 124 Conch Street, Bikini Bottom, 1999, Pacific Ocean" /><br />
        <asp:LinkButton runat="server" Text="Edit" CssClass="right_margin-1"/>
        <asp:LinkButton runat="server" Text="Remove" CssClass="side_margin-1"/>
        <asp:LinkButton runat="server" Text="Set As Default" CssClass="side_margin-1"/>
    </div>

    <br />

    <div class="border_rounded padding-1">
        <asp:Label runat="server" Text="Patrick Star, 120 Conch Street, Bikini Bottom, 1999, Pacific Ocean" /><br />
        <asp:LinkButton runat="server" Text="Edit" CssClass="right_margin-1"/>
        <asp:LinkButton runat="server" Text="Remove" CssClass="side_margin-1"/>
        <asp:LinkButton runat="server" Text="Set As Default" CssClass="side_margin-1"/>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
