<%@ Page Title="" Language="C#" MasterPageFile="~/UL/PagesMaster/Site1Checkout.master" AutoEventWireup="true" CodeBehind="checkoutPayment.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.checkoutPayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- following script exists here because it will not work if placed in scripts folder--%>
    <%-- it forces the radiobuttons in each datarepeater to be 'unique' --%>
    <%-- maybe i should have used a gridview, but since there is only 'sometimes' a unit number, i think this is the best way --%>
    <%-- referenced from: https://weblogs.asp.net/joseguay/having-radiobuttons-on-a-repeater-or-datalist --%>
    <script>
        function SetUniqueRadioButton(nameregex, current) {
            re = new RegExp(nameregex);
            for (i = 0; i < document.forms[0].elements.length; i++) {
                elm = document.forms[0].elements[i]
                if (elm.type == 'radio') {
                    if (re.test(elm.name)) {
                        elm.checked = false;
                    }
                }
            }
            current.checked = true;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <h3>Mailing Address</h3>
    <div class="border_rounded checkout-wrapper">
        <asp:Repeater runat="server" ID="repeaterMailingAddresses" OnItemDataBound="repeaterMailingAddresses_ItemDataBound">
            <HeaderTemplate></HeaderTemplate>
            <ItemTemplate>
                <div class="checkout-address">
                    <asp:RadioButton runat="server" ID="radioButton" CssClass="margin-1" GroupName="MailingAddresses"/>
                    <%--unit no bound in codebehind--%>
                    <asp:Label runat="server"><%#Eval("Name") %>, </asp:Label>
                    <asp:Label runat="server" ID="lblUnitNo" Visible="false" />
                    <asp:Label runat="server"><%#Eval("StreetNo")%>, <%#Eval("Street")%>, <%#Eval("Suburb")%>,  <%#Eval("PostCode")%>, <%#Eval("State")%></asp:Label>
                    <%--this label is invisible - it is used to store an address id for retrieving later--%>
                    <%--there might be a better way of doing this--%>
                    <asp:Label runat="server" ID="lblAddressID" visible="false" Text='<%#Eval("MailingAddressID")%>'></asp:Label>
                </div>
                </ItemTemplate>
            <FooterTemplate></FooterTemplate>
        </asp:Repeater>
    <asp:Button runat="server" ID="btnAddMailingAddress" Text="Add Address" CssClass="button" OnClick="btnAddMailingAddress_Click" CausesValidation="false" />  
        </div> 
    

    <h3>Billing address</h3>
    <div class="border_rounded checkout-wrapper">
        <asp:Repeater runat="server" ID="repeaterBillingAddresses" OnItemDataBound="repeaterBillingAddresses_ItemDataBound">
            <HeaderTemplate></HeaderTemplate>
            <ItemTemplate>
                <div class="checkout-address">
                    <asp:RadioButton runat="server" ID="radioButton" CssClass="margin-1" GroupName="BillingAddresses"/>
                    <%--unit no bound in codebehind--%>
                    <asp:Label runat="server"><%#Eval("Name") %>, </asp:Label>
                    <asp:Label runat="server" ID="lblUnitNo" Visible="false" />
                    <asp:Label runat="server"><%#Eval("StreetNo")%>, <%#Eval("Street")%>, <%#Eval("Suburb")%>,  <%#Eval("PostCode")%>, <%#Eval("State")%></asp:Label>
                    <%--this label is invisible - it is used to store an address id for retrieving later--%>
                    <%--there might be a better way of doing this--%>
                    <asp:Label runat="server" ID="lblAddressID" visible="false" Text='<%#Eval("BillingAddressID")%>'></asp:Label>
                </div>
                </ItemTemplate>
            <FooterTemplate></FooterTemplate>
        </asp:Repeater>
        <asp:LinkButton runat="server" ID="lnkbtnAddBillingAddress" Text="Add Address" CssClass="button" OnClick="btnAddBillingAddress_Click" CausesValidation="false"/>
    </div>

    <br />
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
    <br />
    <%--ideally postage would be a database table--%> 
    <asp:RadioButtonList runat="server" ID="rbtnPostageOptions">
        <asp:ListItem Value="Express" Selected="True"> Express - $30</asp:ListItem>
        <asp:ListItem Value="Regular"> Regular - $20</asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <div class="cart-header">
        <div>
            <asp:HyperLink runat="server" NavigateUrl="~/UL/Pages/cart.aspx" Text="Edit Cart"></asp:HyperLink>
        </div>
        <div style="margin-left: auto; align-self: end; color: grey;">
            <asp:Label runat="server" Text="Price" />
        </div>
    </div>
    
    <div runat="server" id="divCartWrapper" class="cart-wrapper">
        <asp:ListView ID="listviewCartProducts" runat="server" OnItemDataBound="listviewCartProducts_ItemDataBound">
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
                    </div>
                </div>
                <%--<hr class="hr-margin" />--%>
            </ItemTemplate>
        </asp:ListView>
        <hr class="hr-margin" />
    </div>
    <asp:Label runat="server" ID="lblCartTotalPrice" CssClass="cart-price"/>
    <asp:Label runat="server" ID="lblCartTotal" CssClass="cart-total"/>
    <br />
    <asp:Label runat="server" ID="lblPaymentFeedback" Forecolor="Green" Visible="false"/>
    <asp:LinkButton runat="server" ID="btnConfirm" Text="Confirm and pay" OnClick="btnConfirm_Click" CssClass="button cart-button" CausesValidation="false"/>
    <asp:LinkButton runat="server" ID="btnCancel" Text="Cancel" CssClass="button button-cancel" CausesValidation="false" 
            OnClick="btnCancel_Click"/>
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
