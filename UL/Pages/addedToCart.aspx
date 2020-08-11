<%@ Page Title="" Language="C#" MasterPageFile="~/UL/PagesMaster/Site1Footer.master" AutoEventWireup="true" CodeBehind="addedToCart.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.addedToCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="added_to_cart-wrapper">
        <div class="flex-item">
            <asp:HyperLink runat="server" ID="linkProductPage">
                <asp:Image runat="server" ID="imgProductImage" CssClass="image-added_to_cart" />
            </asp:HyperLink>
        </div>
        <div class="flex-item">
            <asp:HyperLink runat="server" ID="linkProductPageTitle">
                <asp:Label ID="lblProductTitle" runat="server" CssClass="product-heading" />
            </asp:HyperLink>
            <br />
            <asp:Label ID="lblAddedToCart" runat="server" Text="Successfully added to cart" CssClass="product-in_stock" />
            <br />
            <asp:Label ID="lblCartSubTotal" runat="server" CssClass="added_to_cart-subtotal" />
            <asp:Label ID="lblCartSubTotalPrice" runat="server" CssClass="added_to_cart-subtotal_price" />
        </div>
        <div class="flex-item flex-item-product_page_buttons">
            <asp:Button ID="btnCart" runat="server" Text="Cart" CssClass="button added_to_cart-button" OnClick="btnCart_Click" />
            <asp:Button ID="btnCheckOut" runat="server" Text="Go to Checkout" CssClass="button added_to_cart-button" OnClick="btnCheckOut_Click" />
        </div>
    </div>
    <br />
    <br />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
