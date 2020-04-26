<%@ Page Title="" Language="C#" MasterPageFile="~/UL/PagesMaster/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.login" %>

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
                <h1>Login</h1>
                <%-- Email input --%>
                <div class="input-field">
                    <%-- Feeback Label --%>
                    <span class="input-error_message">
                        <asp:Label ID="lblFeedback" runat="server" Text="Feedback" Visible="false"></asp:Label>
                    </span>
                    <br />
                    <asp:Label ID="lblEmail" runat="server" Text="Email*"></asp:Label>
                    <asp:TextBox ID="tbxEmail" runat="server" ToolTip="Please enter a registered email." CssClass="input-textbox"></asp:TextBox>
                    <br />
                    <span class="input-error_message">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxEmail" 
                            Display="Dynamic" ErrorMessage="Please enter a registered email." />
                        <%-- Regex sourced from https://stackoverflow.com/questions/1710505/asp-net-email-validator-regex --%>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                            ControlToValidate="tbxEmail" ErrorMessage="Please enter a valid email." Display="Dynamic" 
                            SetFocusOnError="true" />
                    </span>
                </div>
                <%-- Password Input --%>
                <div class="input-field">
                    <asp:Label ID="lblPassword" runat="server" Text="Password*"></asp:Label>
                    <asp:TextBox ID="tbxPassword" runat="server" TextMode="Password" ToolTip="Please enter your password." CssClass="input-textbox"></asp:TextBox>
                    <span class="input-helper_text">
                        <asp:HyperLink ID="linkResetPassword" runat="server" Text="Forgotten your password?" NavigateUrl="~/UL/Pages/resetPassword.aspx" />
                    </span>
                    <span class="input-error_message">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter a password." ControlToValidate="tbxPassword" Display="Dynamic"></asp:RequiredFieldValidator>
                    </span>
                    <br />
                </div>
                <%-- Login Button --%>
                <asp:LinkButton ID="btnLogin" runat="server" CausesValidation="true" OnClick="btnLogin_Click" CssClass="button input-button" text="Login" />
                <br />
                <br />
                <span class="input-helper_text">Haven't got an account yet?<br />
                    <asp:HyperLink ID="linkRegister" runat="server" Text="Click here to Register" NavigateUrl="~/UL/Pages/register.aspx" />
                </span>
            </div>
        </div>
        <div class="grid-item"></div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
