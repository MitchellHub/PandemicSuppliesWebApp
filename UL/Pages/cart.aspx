<%@ Page Title="" Language="C#" MasterPageFile="~/UL/PagesMaster/Site1Footer.master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="cart-header">
        <div>
            <h1>Cart</h1>
        </div>
        <div style="margin-left: auto; align-self: end; color: grey;">
            <asp:Label runat="server" Text="Price" />
        </div>
    </div>

    <div runat="server" id="divCartWrapper" class="cart-wrapper">
        <asp:ListView ID="listviewCartProducts" runat="server" OnItemDataBound="listviewCartProducts_ItemDataBound" OnItemCommand="listviewCartProducts_ItemCommand">
            <ItemTemplate>
                <div runat="server" class="cart-item">
                    <hr class="hr-margin" />
                    <asp:HyperLink runat="server" ID="linkProductPage">
                        <asp:Image runat="server" ID="imgProductImage" CssClass="cart-image" />
                        <asp:Label ID="lblProductTitle" runat="server" CssClass="product-heading cart-heading"><%#Eval("ProductName")%></asp:Label>
                    </asp:HyperLink>
                    <div style="float: right">
                        <asp:Label runat="server" CssClass="cart-price">$<%#Eval("ProductPrice")%></asp:Label>
                    </div>
                    <div class="cart-quantity-wrapper">
                        <%-- qty bound in codebehind--%>
                        <asp:Label runat="server" Text="Qty: " />
                        <asp:Label runat="server" ID="lblProductQty" />
                        <asp:Label runat="server" Text="|" CssClass="side_margin-1"/>
                        <%--button command argument set in codebehind--%>
                        <asp:LinkButton runat="server" Text="Remove" ID="btnRemoveProduct" CommandName="cmdRemoveProduct" CommandArgument='<%#Eval("ProductID")%>'/>
                    </div>
                </div>
                <%--<hr class="hr-margin" />--%>
            </ItemTemplate>
        </asp:ListView>
        <hr class="hr-margin" />
    </div>
    <asp:Label runat="server" ID="lblCartTotalPrice" CssClass="cart-price"/>
    <asp:Label runat="server" ID="lblCartTotal" CssClass="cart-total"/>
    <asp:LinkButton runat="server" ID="btnCheckout" Text="Checkout" OnClick="btnCheckout_Click" CssClass="button cart-button"/>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
