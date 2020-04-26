<%@ Page Title="" Language="C#" MasterPageFile="~/UL/PagesMaster/Site1Footer.master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:Label ID="lblSearchFeedback" runat="server" Text=""></asp:Label>
    <br />

    <%-- Since this page should be generated from the database,
         each control that relates to a specific product will not have an ID (I think)
         Therefore I've left out the IDs 
         I think I will be using something like an asp:literal --%>
    
    <%--<asp:Literal ID="litProducts" runat="server"></asp:Literal>--%>


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
                <asp:Image runat="server" ImageUrl="../IMG/hand_sanitizer.jpg" CssClass="image-product" />
                    </div>
                <p class="product-heading">Vlad's Double-Strength Hand Sanitizer 100ml</p>
                <p class="product_price"><span class="product_price-sale_new">$45.00</span><span class="product_price-sale_old"> $90.00</span></p>
                <p><span class="product-in_stock">In-Stock!</span></p>
            </asp:HyperLink>
        </div>
    </div>
    

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
