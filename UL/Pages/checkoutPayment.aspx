<%@ Page Title="" Language="C#" MasterPageFile="~/UL/PagesMaster/Site1Checkout.master" AutoEventWireup="true" CodeBehind="checkoutPayment.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.checkoutPayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <%-- Delivery Address --%>
    <h3>Delivery Address</h3>
    <div class="border_rounded checkout-wrapper">
        <div class="checkout-address">
            <asp:RadioButton runat="server" CssClass="margin-1" GroupName="deliveryAddress" Checked="true"/><asp:Label runat="server" 
                Text="Spongebob Squarepants, 124 Conch Street, Bikini Bottom, 1999, Pacific Ocean"/>
        </div>
        <div class="checkout-address">
            <asp:RadioButton runat="server" CssClass="margin-1" GroupName="deliveryAddress"/><asp:Label runat="server" 
                Text="Patrick Star, 120 Conch Street, Bikini Bottom, 1999, Pacific Ocean"/>
        </div>
        <asp:LinkButton ID="LinkButton1" runat="server" Text="Add a new address" CssClass="margin-1" OnClick="btnAddDeliveryAddress_Click" CausesValidation="false"/>
    </div>
    <br />
    <%-- Billing address --%>
    <h3>Billing address</h3>
    <div class="border_rounded checkout-wrapper">
        <div class="checkout-address">
            <asp:RadioButton ID="rbtnSameAsDelivery" runat="server" CssClass="margin-1" GroupName="billingAddress" Checked="true" /><asp:Label runat="server"
                Text="Same as delivery address." />
        </div>
        <div class="checkout-address">
            <asp:RadioButton runat="server" CssClass="margin-1" GroupName="billingAddress" />
            <asp:Label runat="server" Text="Spongebob Squarepants, 124 Conch Street, Bikini Bottom, 1999, Pacific Ocean" />
        </div>
        <div class="checkout-address">
            <asp:RadioButton runat="server" CssClass="margin-1" GroupName="billingAddress" />
            <asp:Label runat="server" Text="Patrick Star, 120 Conch Street, Bikini Bottom, 1999, Pacific Ocean" />
        </div>
        <asp:LinkButton ID="btnAddAddress" runat="server" Text="Add a new address" CssClass="margin-1" OnClick="btnAddBillingAddress_Click" CausesValidation="false" />
    </div>
    <br />
    <%-- Payment Method --%>
    <h3>Payment method</h3>
    <div class="border_rounded checkout-wrapper">
        <div class="checkout-address">
            <asp:RadioButton runat="server" CssClass="margin-1" GroupName="paymentMethod" Checked="true" /><asp:Label runat="server"
                Text="Credit or debit Card" />
            <br />
            <asp:Image runat="server" ID="imgMasterCard" ImageUrl="~/UL/IMG/mastercard.png" />
            <br />
            <asp:Label runat="server" Text="The following payment method is not real. These details are not stored or validated." ForeColor="red" />
            <br />
            <div style="border: 1px solid red;">
                <div class="input-field">
                    <asp:Label runat="server" Text="Card Number" />
                    <asp:TextBox runat="server" ID="tbxCardNumber" ToolTip="Please enter the card number" CssClass="input-textbox" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
                        runat="server" 
                        ErrorMessage="Please enter a card number" 
                        ControlToValidate="tbxCardNumber"
                        Display="Dynamic"
                        CssClass="input-error_message" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4"
                        runat="server"
                        ErrorMessage="Card number must be a number"
                        ControlToValidate="tbxCardNumber"
                        Display="Dynamic"
                        CssClass="input-error_message"
                        ValidationExpression="^[0-9]\d*$" />
                    
                    <br />
                </div>
                <div class="input-field">
                    <asp:Label runat="server" Text="Name on card" />
                    <asp:TextBox runat="server" ID="tbxName" ToolTip="Please enter a name." CssClass="input-textbox input-textbox_medium" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" 
                        runat="server" 
                        ErrorMessage="Please enter the name on the card" 
                        ControlToValidate="tbxName"
                        Display="Dynamic"
                        CssClass="input-error_message" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5"
                        runat="server"
                        ErrorMessage="Name on card must be a name"
                        ControlToValidate="tbxName"
                        Display="Dynamic"
                        CssClass="input-error_message"
                        ValidationExpression="^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$" />
                <%--regex sourced from https://www.regextester.com/93648 --%>
                </div>
                <div class="input-field">
                    <asp:Label runat="server" Text="Expiry Month" />
                    <asp:TextBox runat="server" ID="tbxExpMonth" ToolTip="Please a valid expiry date" CssClass="input-textbox input-textbox_small" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                        runat="server" 
                        ErrorMessage="Please enter an expiry month" 
                        ControlToValidate="tbxExpMonth"
                        Display="Dynamic"
                        CssClass="input-error_message" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                        runat="server"
                        ErrorMessage="Expiry month must be a number between 1-12"
                        ControlToValidate="tbxExpMonth"
                        Display="Dynamic"
                        CssClass="input-error_message"
                        ValidationExpression="\b([1-9]|0[1-9]|1[0-2])\b" />

                    <asp:Label runat="server" Text="Expiry Year" />
                    <asp:TextBox runat="server" ID="tbxExpYear" ToolTip="Please a valid expiry date" CssClass="input-textbox input-textbox_small" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                        runat="server" 
                        ErrorMessage="Please enter an year" 
                        ControlToValidate="tbxExpYear"
                        Display="Dynamic"
                        CssClass="input-error_message" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                        runat="server"
                        ErrorMessage="Expiry year must be a number"
                        ControlToValidate="tbxExpYear"
                        Display="Dynamic"
                        CssClass="input-error_message"
                        ValidationExpression="(\d{4})" />
                    
                    <asp:Label runat="server" Text="CVC" />
                    <asp:TextBox runat="server" ID="tbxCVC" ToolTip="Please enter a security code" CssClass="input-textbox input-textbox_small" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                        runat="server" 
                        ErrorMessage="Please enter a CVC" 
                        ControlToValidate="tbxCVC"
                        Display="Dynamic"
                        CssClass="input-error_message" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3"
                        runat="server"
                        ErrorMessage="Security code must be a number"
                        ControlToValidate="tbxCVC"
                        Display="Dynamic"
                        CssClass="input-error_message"
                        ValidationExpression="^[0-9]\d*$" />
                    
                    <br />
                </div>
            </div>
        </div>
    </div>
    <br />
    <%-- Review Order --%>
    <h3>Review order and postage</h3>
    <div class="border_rounded checkout-wrapper">
        <div class="checkout-address">
            <asp:RadioButton ID="rbtnExpressPostage" runat="server" CssClass="margin-1" GroupName="postage" Checked="true" />
            <asp:Label runat="server" Text="Express Postage" />
            <asp:Label runat="server" ID="lblExpressPrice" Text="$30.00" ForeColor="brown"/>
        </div>
        <div class="checkout-address">
            <asp:RadioButton ID="rbtnStandardPostage" runat="server" CssClass="margin-1" GroupName="postage"/>
            <asp:Label runat="server" Text="Standard Postage" />
            <asp:Label runat="server" ID="Label2" Text="$20.00" ForeColor="brown"/>
        </div>
        <div class="cart-wrapper">
            <div runat="server" class="cart-item" id="divFirstProduct">
                <hr class="hr-margin" />
                <asp:HyperLink runat="server" NavigateUrl="~/UL/Pages/product.aspx">
                    <asp:Image runat="server" ImageUrl="../IMG/riot_gas_mask.jpg" CssClass="cart-image" />
                    <asp:Label ID="lblProductTitle" runat="server" Text="Pandemic Supplies Riot Gas Mask Military Grade" CssClass="product-heading cart-heading" />
                </asp:HyperLink>
                <div style="float: right">
                    <asp:Label runat="server" Text="$299.99" CssClass="cart-price" />
                </div>
                <div class="cart-quantity-wrapper">
                    <asp:Label runat="server" ID="lblQty" Text="Quantity: " />
                    <asp:DropDownList ID="lstProductQty" runat="server">
                        <asp:ListItem Selected="true">1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                    </asp:DropDownList>
                    <asp:LinkButton ID="btnRemove" runat="server" OnClick="btnRemove_Click" Text="Remove" />
                </div>
            </div>
                <hr class="hr-margin" />
            <div runat="server" class="cart-item">
                <asp:HyperLink runat="server" NavigateUrl="~/UL/Pages/product.aspx">
                    <asp:Image runat="server" ImageUrl="../IMG/pasta.jpg" CssClass="cart-image" />
                    <asp:Label ID="Label1" runat="server" Text="Uncle Bob's Premium Pasta 500g" CssClass="product-heading cart-heading" />
                </asp:HyperLink>
                <div style="float: right">
                    <asp:Label runat="server" Text="$10" CssClass="cart-price" />
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
                    <asp:LinkButton runat="server" OnClick="btnRemove_Click" Text="Remove" />
                </div>
            </div>
        </div>
        <asp:Label runat="server" ID="lblCartTotalPrice" Text="$349.95" CssClass="cart-price"/>
        <asp:Label runat="server" ID="lblCartTotal" Text="Total (3 Items) + Postage: " CssClass="cart-total"/>
        <br />
    </div>
    <br />
    <asp:Label runat="server" ID="lblPaymentFeedback" Forecolor="Green" Visible="false"/>
    <br />
    <br />
    <asp:LinkButton runat="server" ID="btnConfirm" Text="Confirm and pay" OnClick="btnConfirm_Click" CssClass="button cart-button" CausesValidation="true"/>
    <asp:LinkButton runat="server" ID="btnCancel" Text="Cancel" CssClass="button button-cancel" CausesValidation="false" 
            OnClick="btnCancel_Click" />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
