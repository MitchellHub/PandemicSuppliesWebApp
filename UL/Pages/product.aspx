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

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
