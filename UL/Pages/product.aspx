<%@ Page Title="" Language="C#" MasterPageFile="~/UL/PagesMaster/Site1Footer.master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <%--product values assigned from codebehind--%>
    <div class="flex-wrapper">
        <div class="flex-item flex-item-product_page-image">
            <asp:Image runat="server" ID="imgProductImage" CssClass="image-product_details" />
        </div>
        <div class="flex-item flex-item-product_page-details">
            <h1 class="product_page-heading">
                <asp:Label runat="server" ID="lblProductTitle"/>
            </h1>
            <hr class="hr-margin" />
            <p class="product_page_price">
                <asp:Label runat="server" ID="lblProductPrice" />
                <br />
                <br />
                <%--<span class="product_page_price-old"><asp:Label runat="server" ID="lblProductPriceOld" Text="$not assigned" /></span>--%>
            </p>
            <p>
                <asp:Label runat="server" ID="lblProductStockStatus"/> 
                <asp:Label runat="server" ID="lblProductQuantityAvailable" />
            </p>
            <hr class="hr-margin"/>
            <p><asp:Label runat="server" ID="lblProductDescription"/></p>
            <br />
            <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CssClass="button product_page-button" OnClick="btnAddToCart_Click" Visible="false"/>
        </div>
    </div>
    <hr />
    <br />
    <br />

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
