<%@ Page Title="" Language="C#" MasterPageFile="~/UL/PagesMaster/Site1Footer.master" AutoEventWireup="true" CodeBehind="accountSettings.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.accountSettings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <p><asp:HyperLink runat="server" Text="Your Account" NavigateUrl="~/UL/Pages/account.aspx"/> > Login & Security</p>
    <h1>Login & Security</h1>
    <br />
    <div class="border_rounded padding-1">
        <asp:Label runat="server" Text="Name: " CssClass="bold"/>
       <%--edit name button--%> 
        <asp:Button runat="server" ID="btnName" Text="Edit" CssClass="button float-right" onClick="btnName_Click"/>
         <%--confirm edit name button--%>
        <asp:Button runat="server" ID="btnConfirmName" Text="Confirm" CssClass="button float-right side_margin-1" onClick="btnConfirmName_Click" Visible="false" CausesValidation="true"/>
        <br />
        <asp:Label runat="server" ID="lblName" Visible="true"/>

        <asp:TextBox runat="server" ID="tbxName" Visible="false" ToolTip="Enter a new name"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
            runat="server" 
            ErrorMessage="Please enter a new name" 
            ControlToValidate="tbxName"
            CssClass="input-error_message"
            ValidationGroup="namevalidationgroup"/>
        <%--not validated as a real name, as i don't care what the user enters as their name--%>

        <hr class="hr-margin" />

        <asp:Label runat="server" Text="Email: " CssClass="bold"/>
        <%--confirm edit email button--%> 
        <asp:Button runat="server" ID="btnConfirmEmail" Text="Confirm" CssClass="button float-right" OnClick="btnConfirmEmail_Click" Visible="false" CausesValidation="true"/>
        <%--edit email button--%>
        <asp:Button runat="server" ID="btnEmail" Text="Edit" CssClass="button float-right" OnClick="btnEmail_Click"/>
        <br />
        <asp:Label runat="server" ID="lblEmail"/>

        <asp:TextBox runat="server" ID="tbxEmail" Visible="false" ToolTip="Enter a new password" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
            runat="server" 
            ErrorMessage="Please enter a new email" 
            ControlToValidate="tbxEmail"
            CssClass="input-error_message"
            ValidationGroup="namevalidationgroup"/>

        <hr class="hr-margin" />

        <asp:Label runat="server" Text="Password: " CssClass="bold"/><asp:Button runat="server" ID="btnPassword" Text="Reset" CssClass="button float-right" OnClick="btnPassword_Click"/>
        <br />
        <asp:Label runat="server" ID="lblPassword" Text="********"/>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
