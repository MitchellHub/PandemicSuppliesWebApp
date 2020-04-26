<%@ Page Title="" Language="C#" MasterPageFile="~/UL/PagesMaster/Site1.master" AutoEventWireup="true" CodeBehind="resetPassword.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.resetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h1 style="text-align: center; padding-top: 2rem;">
        <asp:HyperLink ID="linkLogo" runat="server" NavigateUrl="~/UL/Pages/main.aspx" Text="Pandemic Supplies" CssClass="nav-link nav-logo" ForeColor="Black"/>
    </h1>
    <div class="grid-wrapper-login">
        <div class="grid-item"></div>
        <div class="grid-item grid-item-logincard">
            <div class="input-wrapper">
                <h1>Password Reset</h1>

                <div class="input-field">
                    <span class="input-error_message">
                    </span>
                    <p>Enter an email registered with us and we'll send you a link to reset your password.</p>
                    <br />
                    <asp:Label ID="lblEmail" runat="server" Text="Email*"></asp:Label>
                    <asp:TextBox ID="tbxEmail" runat="server" ToolTip="Please enter a registered email address" CssClass="input-textbox"></asp:TextBox>
                    <br />

                    <span class="input-error_message">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxEmail" 
                            Display="Dynamic" ErrorMessage="Please enter an email address." />
                        <%-- Regex sourced from https://stackoverflow.com/questions/1710505/asp-net-email-validator-regex --%>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                            ControlToValidate="tbxEmail" ErrorMessage="Please enter a valid email address." Display="Dynamic" 
                            SetFocusOnError="true" />
                        <asp:Label ID="lblFeedback" runat="server" Text="Feedback" Visible="false"></asp:Label>
                    </span>
                    <br />
                    </div>
                <asp:LinkButton ID="btnResetPassword" runat="server" CausesValidation="true" OnClick="btnResetPassword_Click" CssClass="button input-button" text="Reset Password" />
                <br />
                <br />
            </div>
        </div>
        <div class="grid-item"></div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
