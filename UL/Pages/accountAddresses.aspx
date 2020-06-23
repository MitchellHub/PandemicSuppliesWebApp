<%@ Page Title="" Language="C#" MasterPageFile="~/UL/PagesMaster/Site1Footer.master" AutoEventWireup="true" CodeBehind="accountAddresses.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.accountAddresses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <p><asp:HyperLink runat="server" Text="Your Account" NavigateUrl="~/UL/Pages/account.aspx"/> > Your Addresses</p>
    <h1>Your Addresses</h1>
    <br />
    <h4>Billing Addresses</h4>
    <asp:ListView runat="server" ID="lvwBillingAddresses" OnItemCommand="lvwBillingAddresses_ItemCommand">
        <ItemTemplate>
            <div class="border_rounded padding-1">
                <asp:Label runat="server" ID="lblAddress"><%#Eval("Name") %>, <%#Eval("UnitNo")%>, <%#Eval("StreetNo")%>, <%#Eval("Street")%>, <%#Eval("Suburb")%>,  <%#Eval("PostCode")%>, <%#Eval("State")%></asp:Label>
                <br />
                <asp:LinkButton runat="server" Text="Edit" CssClass="right_margin-1" />
                <asp:LinkButton runat="server" Text="Remove" CssClass="side_margin-1" CommandName="remove" CommandArgument='<%#Eval("BillingAddressID")%>'/>
                <asp:LinkButton runat="server" Text="Set As Default" CssClass="side_margin-1" CommandName="setDefault" CommandArgument='<%#Eval("BillingAddressID")%>'/>
            </div>
            <br />
        </ItemTemplate>
    </asp:ListView>
    

    <br />

    <h4>Mailing Addresses</h4>
    <div class="border_rounded padding-1">
        <asp:Label runat="server" Text="Patrick Star, 120 Conch Street, Bikini Bottom, 1999, Pacific Ocean" /><br />
        <asp:LinkButton runat="server" Text="Edit" CssClass="right_margin-1"/>
        <asp:LinkButton runat="server" Text="Remove" CssClass="side_margin-1"/>
        <asp:LinkButton runat="server" Text="Set As Default" CssClass="side_margin-1"/>
    </div>
    <asp:Button runat="server" ID="btnAddAddress" OnClick="btnAddAddress_Click" CssClass="button cart-button" Text="Add Address"/>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
