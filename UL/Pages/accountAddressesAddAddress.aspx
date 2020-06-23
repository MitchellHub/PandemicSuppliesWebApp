<%@ Page Title="" Language="C#" MasterPageFile="~/UL/PagesMaster/Site1Footer.master" AutoEventWireup="true" CodeBehind="accountAddressesAddAddress.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.accountAddressesAddAddress" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h1>Add Address</h1>
    <div class="border_rounded checkout-wrapper">
        <%-- Full Name --%>
        <div class="input-field">
            <asp:Label runat="server" Text="Full Name*" />
            <asp:TextBox runat="server" ID="tbxName" ToolTip="Please enter the name to be billed." CssClass="input-textbox" />
            <br />
            <span class="input-error_message">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxName" 
                    Display="Dynamic" ErrorMessage="Please enter a name to be billed."></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator3" 
                    ValidationExpression="^[a-zA-Z ,.'-]{1,250}$" 
                    ControlToValidate="tbxName" ErrorMessage="Please enter a name smaller than 250 characters" Display="Dynamic" />
            </span>
        </div>
        <%-- Phone No. --%>
        <div class="input-field">
            <asp:Label runat="server" Text="Phone Number*" />
            <asp:TextBox runat="server" ID="tbxPhoneNumber" ToolTip="Please enter the phone number to be billed" CssClass="input-textbox" />
            <br />
            <span class="input-error_message">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tbxPhoneNumber" 
                    Display="Dynamic" ErrorMessage="Please enter a phone number."></asp:RequiredFieldValidator>
                <%-- Regex sourced from https://stackoverflow.com/questions/39990179/regex-for-australian-phone-number-validation --%>
                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" 
                    ValidationExpression="^(?:\+?(61))? ?(?:\((?=.*\)))?(0?[2-57-8])\)? ?(\d\d(?:[- ](?=\d{3})|(?!\d\d[- ]?\d[- ]))\d\d[- ]?\d[- ]?\d{3})$" 
                    ControlToValidate="tbxPhoneNumber" ErrorMessage="Please enter a valid Phone Number." Display="Dynamic" />
            </span>
        </div>
        <%-- Unit No. --%>
        <div class="input-field">
            <asp:Label runat="server" Text="Unit No" />
            <asp:TextBox runat="server" ID="tbxUnitNo" ToolTip="Please enter a unit number" CssClass="input-textbox" />
            <span class="input-error_message">
                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator4" 
                    ValidationExpression="\d" 
                    ControlToValidate="tbxUnitNo" ErrorMessage="Please enter a number." Display="Dynamic" />
            </span>
        </div>
        <%-- Street No. --%>
        <div class="input-field">
            <asp:Label runat="server" Text="Street Number*" />
            <asp:TextBox runat="server" ID="tbxStreetNo" ToolTip="Please enter a street number" CssClass="input-textbox" />
            <span class="input-error_message">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbxStreetNo" 
                    Display="Dynamic" ErrorMessage="Please enter a street number." />
                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator5" 
                    ValidationExpression="\d{1,10}" 
                    ControlToValidate="tbxStreetNo" ErrorMessage="Please enter a number smaller than 10 digits" Display="Dynamic" />
            </span>
        </div>
        <%-- Street --%>
        <div class="input-field">
            <asp:Label runat="server" Text="Street*" />
            <asp:TextBox runat="server" ID="tbxStreet" ToolTip="Please enter a street name" CssClass="input-textbox" />
            <span class="input-error_message">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbxStreet" 
                    Display="Dynamic" ErrorMessage="Please enter a street name." />
                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator6" 
                    ValidationExpression="^[a-z ,.'-]{1,250}$" 
                    ControlToValidate="tbxStreet" ErrorMessage="Please enter a street name smaller than 250 characters." Display="Dynamic" />
            </span>
        </div>
        <%-- Suburb --%>
        <div class="input-field">
            <asp:Label runat="server" Text="Suburb*" />
            <asp:TextBox runat="server" ID="tbxSuburb" ToolTip="Please enter a suburb" CssClass="input-textbox" />
            <span class="input-error_message">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbxSuburb" 
                    Display="Dynamic" ErrorMessage="Please enter a suburb." />
                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator7" 
                    ValidationExpression="^[a-z ,.'-]{1,250}$" 
                    ControlToValidate="tbxSuburb" ErrorMessage="Please enter a suburb name smaller than 250 characters" Display="Dynamic" />
            </span>
        </div>
        <%-- Post Code --%>
        <div class="input-field">
            <asp:Label runat="server" Text="Post Code*" />
            <asp:TextBox runat="server" ID="tbxPostCode" ToolTip="Please enter a valid Australian post code" CssClass="input-textbox" />
            <span class="input-error_message">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbxPostCode" 
                    Display="Dynamic" ErrorMessage="Please enter a valid Australian post code." />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ValidationExpression="(\d{3,4})"
                    ErrorMessage="Please enter a valid Australian post code." ControlToValidate="tbxPostCode" Display="Dynamic"/>
            </span>
        </div>
        <%-- State --%>
        <div class="input-field">
            <asp:Label runat="server" Text="State*" />
            <asp:DropDownList ID="listStates" runat="server">
                <asp:ListItem Selected="true">~</asp:ListItem>
                <asp:ListItem>NSW</asp:ListItem>
                <asp:ListItem>VIC</asp:ListItem>
                <asp:ListItem>QLD</asp:ListItem>
                <asp:ListItem>WA</asp:ListItem>
                <asp:ListItem>SA</asp:ListItem>
                <asp:ListItem>TAS</asp:ListItem>
            </asp:DropDownList>
            <span class="input-error_message">
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Please select a state" 
                     ControlToValidate="listStates" ValueToCompare="~" Operator="NotEqual" Type="String"/>
            </span>
            <br />
            <br />
            <asp:CheckBox runat="server" ID="cbxDefaultAddress"/>
            <asp:Label runat="server" Text="Make this address the default address" />
            <br />
            <br />
            <asp:CheckBox runat="server" ID="cbxBillingAddress"/>
            <asp:Label runat="server" Text="Mark this as a billing address" />
        </div>
    </div>
    <br />
        <asp:LinkButton runat="server" ID="btnAddAddress" Text="Register Address" CssClass="button" CausesValidation="true" 
            OnClick="btnAddAddress_Click" />
        <asp:LinkButton runat="server" ID="btnCancel" Text="Cancel" CssClass="button button-cancel" CausesValidation="false" 
            OnClick="btnCancel_Click" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
