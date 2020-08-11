<%@ Page Title="" Language="C#" MasterPageFile="~/UL/PagesMaster/Site1Footer.master" AutoEventWireup="true" CodeBehind="accountAddresses.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.accountAddresses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <p><asp:HyperLink runat="server" Text="Your Account" NavigateUrl="~/UL/Pages/account.aspx"/> > Your Addresses</p>
    
    <h1>Your Addresses</h1>
    <br />

    <h3>Billing Addresses</h3>
    <br />
    <asp:ListView runat="server" ID="lvwBillingAddresses" OnItemCommand="lvwBillingAddresses_ItemCommand" OnItemDataBound="lvwAddresses_ItemDataBound">
        <ItemTemplate>
            <asp:Label runat="server" ID="lblDefaultAddress" Text="Default Address" Visible="false" ForeColor="Green"></asp:Label>
            <div class="border_rounded padding-1">
                <asp:Label runat="server"><%#Eval("Name") %>, </asp:Label>
                <%--unit no bound in codebehind--%>
                <asp:Label runat="server" ID="lblUnitNo" Visible="false" />
                <asp:Label runat="server"><%#Eval("StreetNo")%>, <%#Eval("Street")%>, <%#Eval("Suburb")%>,  <%#Eval("PostCode")%>, <%#Eval("State")%></asp:Label>
                <br />
                <%--<asp:LinkButton runat="server" Text="Edit" CssClass="right_margin-1" CommandName="edit" CommandArgument='<%#Eval("BillingAddressID")%>' />--%>
                <asp:LinkButton runat="server" Text="Remove" CssClass="side_margin-1" CommandName="remove" CommandArgument='<%#Eval("BillingAddressID")%>' />
                <asp:LinkButton runat="server" Text="Set As Default" CssClass="side_margin-1" CommandName="setDefault" CommandArgument='<%#Eval("BillingAddressID")%>' />
            </div>
            <br />
        </ItemTemplate>
    </asp:ListView>

    <br />
    <h3>Mailing Addresses</h3>
    <br />
    <asp:ListView runat="server" ID="lvwMailingAddresses" OnItemCommand="lvwMailingAddresses_ItemCommand" OnItemDataBound="lvwAddresses_ItemDataBound">
        <ItemTemplate>
            <asp:Label runat="server" ID="lblDefaultAddress" Text="Default Address" Visible="false" ForeColor="Green"></asp:Label>
            <div class="border_rounded padding-1">
                <asp:Label runat="server"><%#Eval("Name") %>, </asp:Label>
                <%--unit no bound in codebehind--%> 
                <asp:Label runat="server" ID="lblUnitNo" Visible="false" />
                <asp:Label runat="server"><%#Eval("StreetNo")%>, <%#Eval("Street")%>, <%#Eval("Suburb")%>,  <%#Eval("PostCode")%>, <%#Eval("State")%></asp:Label>
                <br />
                <%--<asp:LinkButton runat="server" Text="Edit" CssClass="right_margin-1" CommandName="edit" CommandArgument='<%#Eval("MailingAddressID")%>'/>--%>
                <asp:LinkButton runat="server" Text="Remove" CssClass="side_margin-1" CommandName="remove" CommandArgument='<%#Eval("MailingAddressID")%>'/>
                <asp:LinkButton runat="server" Text="Set As Default" CssClass="side_margin-1" CommandName="setDefault" CommandArgument='<%#Eval("MailingAddressID")%>'/>
            </div>
            <br />
        </ItemTemplate>
    </asp:ListView>
    <asp:Button runat="server" ID="btnAddAddress" OnClick="btnAddAddress_Click" CssClass="button cart-button" Text="Add Address"/>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
