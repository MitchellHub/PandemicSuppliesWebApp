<%@ Page Title="" Language="C#" MasterPageFile="~/UL/PagesMaster/Site1Footer.master" AutoEventWireup="true" CodeBehind="checkoutConfirmation.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.checkoutConfirmation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h2>Order confirmed</h2>
    <p>Thank you for supporting Australian business and shopping with Pandemic Supplies. We've emailed you a reciept of your order.</p>
    <p>An email will be sent when your items have been shipped.</p>

    <div runat="server" id="divCartWrapper" class="cart-wrapper">
        <asp:ListView ID="lvwInvoiceProducts" runat="server" OnItemDataBound="lvwInvoiceProducts_ItemDataBound">
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
                </div>
                <%--<hr class="hr-margin" />--%>
            </ItemTemplate>
        </asp:ListView>
        <div class="cart-quantity-wrapper">
            <asp:Label runat="server" Text="Total Invoice Cost: $" />
            <asp:Label runat="server" ID="lblTotalInvoiceCost" />
        </div>
        <hr class="hr-margin" />
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
