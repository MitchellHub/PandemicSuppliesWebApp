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

    <%-- Since this page should be generated from the database,
         each control that relates to a specific product will not have an ID (I think)
         Therefore I've left out the IDs 
         I think I will be using something like an asp:literal --%>
    <%--<asp:Literal ID="litProducts" runat="server"></asp:Literal>--%>

    <div runat="server" ID="divCartWrapper" class="cart-wrapper">
        <div runat="server" class="cart-item" id="divFirstProduct">
            <hr class="hr-margin" />
            <asp:HyperLink runat="server" NavigateUrl="~/UL/Pages/product.aspx">
                <asp:Image runat="server" ImageUrl="../IMG/riot_gas_mask.jpg" CssClass="cart-image" />
                <asp:Label ID="lblProductTitle" runat="server" Text="Pandemic Supplies Riot Gas Mask Military Grade" CssClass="product-heading cart-heading" />
            </asp:HyperLink>
            <div style="float: right">
                <asp:Label runat="server" Text="$299.99" CssClass="cart-price"/>
            </div>
            <div class="cart-quantity-wrapper">
                <asp:Label runat="server" ID="lblQty" Text="Quantity: " />
                <asp:DropDownList ID="lstProductQty" runat="server">
                    <asp:ListItem Selected="true">1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                </asp:DropDownList>
                <asp:LinkButton runat="server" OnClick="btnRemove_Click" Text="Remove"/>
            </div>
        </div>
        <div runat="server" class="cart-item">
            <hr class="hr-margin" />
            <asp:HyperLink runat="server" NavigateUrl="~/UL/Pages/product.aspx">
                <asp:Image runat="server" ImageUrl="../IMG/pasta.jpg" CssClass="cart-image" />
                <asp:Label ID="Label1" runat="server" Text="Uncle Bob's Premium Pasta 500g" CssClass="product-heading cart-heading" />
            </asp:HyperLink>
            <div style="float: right">
                <asp:Label runat="server" Text="$10" CssClass="cart-price"/>
            </div>
            <div class="cart-quantity-wrapper">
                <asp:Label runat="server" Text="Quantity: " />
                <asp:DropDownList runat="server">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem Selected="true">2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                </asp:DropDownList>
                <asp:LinkButton runat="server" OnClick="btnRemove_Click" Text="Remove"/>
            </div>
        </div>
        <hr class="hr-margin" />
    </div>
    <asp:Label runat="server" ID="lblCartTotalPrice" Text="$319.95" CssClass="cart-price"/>
    <asp:Label runat="server" ID="lblCartTotal" Text="Total (3 Items)" CssClass="cart-total"/>
    <asp:LinkButton runat="server" ID="btnCheckout" Text="Checkout" OnClick="btnCheckout_Click" CssClass="button cart-button"/>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
