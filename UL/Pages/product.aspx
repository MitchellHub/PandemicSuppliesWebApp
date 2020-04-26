<%@ Page Title="" Language="C#" MasterPageFile="~/UL/PagesMaster/Site1Footer.master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="flex-wrapper">
        <div class="flex-item flex-item-product_page-image">
            <asp:Image runat="server" ImageUrl="../IMG/riot_gas_mask.jpg" CssClass="image-product_details" />
        </div>
        <div class="flex-item flex-item-product_page-details">
            <h1 class="product_page-heading">
                <asp:Label runat="server" ID="lblProductTitle" Text="Pandemic Supplies Riot Gas Mask Military Grade" />
            </h1>
            <hr class="hr-margin" />
            <p class="product_page_price">
                <span class=""><asp:Label runat="server" ID="lblProductPrice" Text="$299.95" /></span>
                <span class="product_page_price-old"><asp:Label runat="server" ID="lblProductPriceOld" Text="$400.00" /></span>
            </p>
            <p>
                <span class="product-in_stock">
                    <asp:Label runat="server" ID="lblProductStockStatus" Text="In-Stock!" /> 
                    <asp:Label runat="server" ID="lblProductQuantityAvailable" Text="(4) Available" />
                </span>
            </p>
            <hr class="hr-margin"/>
            <p><asp:Label runat="server" ID="lblProductDescription" 
                Text="Genuine military-grade gas mask. Riot mask included."/></p>
            <br />
            <asp:Label runat="server" ID="lblQty" Text="Quantity: " />
            <asp:DropDownList ID="lstQty" runat="server">
                <asp:ListItem Selected="true">1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CssClass="button product_page-button" OnClick="btnAddToCart_Click"/>
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
