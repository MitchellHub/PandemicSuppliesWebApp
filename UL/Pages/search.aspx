<%@ Page Title="" Language="C#" MasterPageFile="~/UL/PagesMaster/Site1Footer.master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:Label ID="lblSearchFeedback" runat="server" Text=""></asp:Label>
    <br />
    <div class="grid-wrapper_products">
        <asp:ListView ID="listviewProductsSearch" runat="server" OnItemDataBound="listviewProductsSearch_ItemDataBound">
            <ItemTemplate>
                <div class="grid-item-product">
                    <%--url bound in codebehind--%>
                    <asp:HyperLink runat="server" ID="lnkProductLink">
                        <div class="image-product-wrapper">
                            <%-- image source bound in codebehind --%>
                            <asp:Image runat="server" ID="imgProductImage" CssClass="image-product" />
                        </div>
                        <p class="product-heading"><%#Eval("ProductName")%></p>
                        <p class="product_price">$<%#Eval("ProductPrice")%></p>
                        <p><span class="product-in_stock">Stock Level: <%#Eval("StockLevel")%></span></p>
                    </asp:HyperLink>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
