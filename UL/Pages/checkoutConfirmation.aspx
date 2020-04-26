<%@ Page Title="" Language="C#" MasterPageFile="~/UL/PagesMaster/Site1Footer.master" AutoEventWireup="true" CodeBehind="checkoutConfirmation.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.checkoutConfirmation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h2>Order confirmed</h2>
    <p>Thank you for supporting Australian business and shopping with Pandemic Supplies. We've emailed you a reciept of your order.</p>
    <p>An email will be sent when your items have been shipped.</p>

    <div class="cart-wrapper">
        <div runat="server" class="cart-item" id="divFirstProduct">
            <hr class="hr-margin" />
            <asp:HyperLink runat="server" NavigateUrl="~/UL/Pages/product.aspx">
                <asp:Image runat="server" ImageUrl="../IMG/riot_gas_mask.jpg" CssClass="cart-image" />
                <asp:Label ID="lblProductTitle" runat="server" Text="Pandemic Supplies Riot Gas Mask Military Grade" CssClass="product-heading cart-heading" />
            </asp:HyperLink>
            <br />
            <asp:Label runat="server" ID="lblQty" Text="Quantity: 1" />
        </div>
        <div runat="server" class="cart-item">
            <hr class="hr-margin" />
            <asp:HyperLink runat="server" NavigateUrl="~/UL/Pages/product.aspx">
                <asp:Image runat="server" ImageUrl="../IMG/pasta.jpg" CssClass="cart-image" />
                <asp:Label runat="server" Text="Uncle Bob's Premium Pasta 500g" CssClass="product-heading cart-heading" />
            </asp:HyperLink>
            <br />
            <asp:Label runat="server" Text="Quantity: 2" />
        </div>
        <hr class="hr-margin" />
    </div>

    <h3><asp:Label runat="server" Text="We also recommend these items" CssClass="product_page-heading" /></h3>
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
