<%@ Page Title="" Language="C#" MasterPageFile="~/UL/PagesMaster/Site1Footer.master" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <%--<h1>Main</h1>--%>
    <div class="grid-wrapper_products">
        <asp:ListView ID="listviewProducts" runat="server" OnItemDataBound="listviewProducts_DataBound">
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
