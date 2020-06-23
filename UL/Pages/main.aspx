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

    
<%--    <div class="grid-wrapper_products">
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
        <div class="grid-item-product">
            <asp:HyperLink runat="server" NavigateUrl="~/UL/Pages/product.aspx" ForeColor="Black">
                <div class="image-product-wrapper">
                <asp:Image runat="server" ImageUrl="../IMG/pasta.jpg" CssClass="image-product" />
                    </div>
                <p class="product-heading">Uncle Bob's Premium Pasta 500g</p>
                <p class="product_price">$10.00</p>
                <p><span class="product-in_stock">In-Stock!</span></p>
            </asp:HyperLink>
        </div>
        <div class="grid-item-product">
            <asp:HyperLink runat="server" NavigateUrl="~/UL/Pages/product.aspx" ForeColor="Black">
                <div class="image-product-wrapper">
                <asp:Image runat="server" ImageUrl="../IMG/bottled_water.jpg" CssClass="image-product" />
                    </div>
                <p class="product-heading">Mountain Spring Water 500ml Bottle</p>
                <p class="product_price">$5.00</p>
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
        <div class="grid-item-product">
            <asp:HyperLink runat="server" NavigateUrl="~/UL/Pages/product.aspx" ForeColor="Black">
                <div class="image-product-wrapper">
                <asp:Image runat="server" ImageUrl="../IMG/rice.jpg" CssClass="image-product" />
                    </div>
                <p class="product-heading">White Long Grain Rice 1kg Bag</p>
                <p class="product_price">$19.95</p>
                <p><span class="product-out_of_stock">Unavailable!</span></p>
            </asp:HyperLink>
        </div>
        <div class="grid-item-product">
            <asp:HyperLink runat="server" NavigateUrl="~/UL/Pages/product.aspx" ForeColor="Black">
                <div class="image-product-wrapper">
                <asp:Image runat="server" ImageUrl="../IMG/rice.jpg" CssClass="image-product" />
                    </div>
                <p class="product-heading">White Long Grain Rice 2kg Bag</p>
                <p class="product_price"><span class="product_price-sale_new">$29.95</span><span class="product_price-sale_old"> $39.95</span></p>
                <p><span class="product-in_stock">In-Stock!</span></p>
            </asp:HyperLink>
        </div>
        <div class="grid-item-product">
            <asp:HyperLink runat="server" NavigateUrl="~/UL/Pages/product.aspx" ForeColor="Black">
                <div class="image-product-wrapper">
                    <asp:Image runat="server" ImageUrl="../IMG/riot_gas_mask.jpg" CssClass="image-product" />
                    </div>
                <p class="product-heading">Pandemic Supplies Riot Gas Mask Military Grade</p>
                <p class="product_price"><span class="product_price-sale_new">$299.95</span><span class="product_price-sale_old"> $400.00</span></p>
                <p><span class="product-in_stock">In-Stock!</span></p>
            </asp:HyperLink>
        </div>
    </div>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
