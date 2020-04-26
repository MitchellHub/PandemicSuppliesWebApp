<%@ Page Title="" Language="C#" MasterPageFile="~/UL/PagesMaster/Site1Footer.master" AutoEventWireup="true" CodeBehind="orders.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <p><asp:HyperLink runat="server" Text="Your Account" NavigateUrl="~/UL/Pages/account.aspx"/> > Your Orders</p>
    <h1>Your Orders</h1>
    <br />

    <asp:Label runat="server" Text="Order # 3333333333" />
    <div class="border_rounded padding-1">
        <h3><asp:Label runat="server" Text="Ordered 5 March. 2020" /></h3>
        <br />
        <div class="cart-wrapper">
            <asp:HyperLink runat="server" NavigateUrl="~/UL/Pages/product.aspx">
                <asp:Image runat="server" ImageUrl="../IMG/riot_gas_mask.jpg" CssClass="cart-image" />
                <asp:Label ID="lblProductTitle" runat="server" Text="Pandemic Supplies Riot Gas Mask Military Grade" CssClass="product-heading cart-heading" />
            </asp:HyperLink>
            <br />
            <asp:Label runat="server" ID="lblQty" Text="Quantity: 1" />
            <hr class="hr-margin" />
            <asp:HyperLink runat="server" NavigateUrl="~/UL/Pages/product.aspx">
                <asp:Image runat="server" ImageUrl="../IMG/pasta.jpg" CssClass="cart-image" />
                <asp:Label runat="server" Text="Uncle Bob's Premium Pasta 500g" CssClass="product-heading cart-heading" />
            </asp:HyperLink>
            <br />
            <asp:Label runat="server" Text="Quantity: 2" />
    </div>

    </div>
    <br />
    <asp:Label runat="server" Text="Order # 666666666" />
    <div class="border_rounded padding-1">
        <h3><asp:Label runat="server" Text="Delivered 10 Feb. 2020" /></h3>
        <br />
        <div class="cart-wrapper">
                <asp:HyperLink runat="server" NavigateUrl="~/UL/Pages/product.aspx">
                    <asp:Image runat="server" ImageUrl="../IMG/pasta.jpg" CssClass="cart-image" />
                    <asp:Label runat="server" Text="Uncle Bob's Premium Pasta 500g" CssClass="product-heading cart-heading" />
                </asp:HyperLink>
                <br />
                <asp:Label runat="server" Text="Quantity: 5" />
            </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
