<%@ Page Title="" Language="C#" MasterPageFile="~/UL/PagesMaster/Site1Footer.master" AutoEventWireup="true" CodeBehind="addedToCart.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.addedToCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="added_to_cart-wrapper">
        <div class="flex-item">
            <asp:HyperLink runat="server" NavigateUrl="~/UL/Pages/product.aspx">
            <asp:Image runat="server" ImageUrl="../IMG/riot_gas_mask.jpg" CssClass="image-added_to_cart" />
            </asp:HyperLink>
        </div>
        <div class="flex-item">
            <asp:HyperLink runat="server" NavigateUrl="~/UL/Pages/product.aspx">
            <asp:Label ID="lblProductTitle" runat="server" Text="Pandemic Supplies Riot Gas Mask Military Grade" CssClass="product-heading" />
            </asp:HyperLink>
            <br />
            <asp:Label ID="lblAddedToCart" runat="server" Text="Successfully added to cart" CssClass="product-in_stock" />
            <br />
            <asp:Label ID="lblCartSubTotal" runat="server" Text="Cart Subtotal (3 Items): " CssClass="added_to_cart-subtotal" />
            <asp:Label ID="lblCartSubTotalPrice" runat="server" Text="$319.95" CssClass="added_to_cart-subtotal_price" />
        </div>
        <div class="flex-item flex-item-product_page_buttons">
            <asp:Button ID="btnCart" runat="server" Text="Cart" CssClass="button added_to_cart-button" OnClick="btnCart_Click"/>
            <asp:Button ID="btnCheckOut" runat="server" Text="Go to Checkout" CssClass="button added_to_cart-button" OnClick="btnCheckOut_Click"/>
        </div>
    </div>
    <br />
    <br />
    <h3><asp:Label runat="server" Text="We also recommend these items " CssClass="product_page-heading" /></h3>

    <div class="grid-wrapper_products">
        <div class="grid-item-product">
            <asp:HyperLink runat="server" NavigateUrl="~/UL/Pages/product.aspx" ForeColor="Black">
                <div class="image-product-wrapper">
                <asp:Image runat="server" ImageUrl="../IMG/hand_sanitizer.jpg" CssClass="image-product" />
                    </div>
                <p class="product-heading">Vlad's Double-Strength Hand Sanitizer 50ml</p>
                <p class="product_price"><span class="product_price-sale_new">$25.00</span><span class="product_price-sale_old"> $50.00</span></p>
                <p><span class="product-in_stock">In-Stock!</span></p>
            </asp:HyperLink>
        </div>

        <div class="grid-item-product">
            <asp:HyperLink runat="server" NavigateUrl="~/UL/Pages/product.aspx" ForeColor="Black">
                <div class="image-product-wrapper">
                <asp:Image runat="server" ImageUrl="../IMG/bottled_water.jpg" CssClass="image-product" />
                    </div>
                <p class="product-heading">Mountain Spring Water 1 litre Bottle</p>
                <p class="product_price">$10.00</p>
                <p><span class="product-in_stock">In-Stock!</span></p>
            </asp:HyperLink>
        </div>

        <div class="grid-item-product">
            <asp:HyperLink runat="server" NavigateUrl="~/UL/Pages/product.aspx" ForeColor="Black">
                <div class="image-product-wrapper">
                <asp:Image runat="server" ImageUrl="../IMG/bottled_water.jpg" CssClass="image-product" />
                    </div>
                <p class="product-heading">Mountain Spring Water 2 litre Bottle</p>
                <p class="product_price">$15.00</p>
                <p><span class="product-out_of_stock">Unavailable!</span></p>
            </asp:HyperLink>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
