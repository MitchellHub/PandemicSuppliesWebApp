<%@ Page Title="" Language="C#" MasterPageFile="~/UL/PagesMaster/Site1Footer.master" AutoEventWireup="true" CodeBehind="orders.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <p><asp:HyperLink runat="server" Text="Your Account" NavigateUrl="~/UL/Pages/account.aspx"/> > Your Orders</p>
    <h1>Your Orders</h1>
    <br />

    <div runat="server" id="divCartWrapper" class="cart-wrapper">
        <asp:ListView ID="lvwInvoices" runat="server">
            <ItemTemplate>
                <div class="border_rounded padding-1">
                    <asp:Label runat="server" Text="Order # " ><%#Eval("InvoiceID")%></asp:Label><br />
                    <asp:Label runat="server" Text="Delivery Address: "></asp:Label><asp:Label runat="server" ID="lblDeliveryAddress" /><br />
                    <asp:Label runat="server" Text="Total Cost: "> </asp:Label><asp:Label runat="server" ID="lblTotal" /><br />
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
