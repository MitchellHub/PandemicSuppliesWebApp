<%@ Page Title="" Language="C#" MasterPageFile="~/UL/PagesMaster/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="grid-wrapper-login">
        <div class="grid-item"></div>
        <div class="grid-item grid-item-logincard">
            <div class="input-wrapper">

                <h1>Welcome</h1>

                <%-- Email input --%>
                <div class="input-field">
                    <%-- Feeback Label --%>
                    <span class="input-error_message">
                        <asp:Label ID="lblFeedback" runat="server" Text="Feedback" Visible="false"></asp:Label>
                    </span>
                    <br />
                    <label for="tbxEmail" class="input-label">Email*</label>
                    <asp:TextBox ID="tbxEmail" runat="server" ToolTip="Please enter a registered email." CssClass="input-textbox"></asp:TextBox>
                    <br />
                    <span class="input-error_message">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxEmail" Display="Dynamic" ErrorMessage="Please enter a registered email."></asp:RequiredFieldValidator>
                        <%-- trigger event for leaving textbox --%>
                        <%-- Email validator: 1 @ >2 . >2 --%>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="tbxEmail" ErrorMessage="Please enter a valid email." Display="Dynamic" SetFocusOnError="true"></asp:RegularExpressionValidator>
                    </span>

                </div>

                <%-- Password Input --%>
                <div class="input-field">
                    <label for="tbxPassword" class="input-label">Password*</label>
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
                <asp:LinkButton ID="btnLogin" runat="server" CausesValidation="true" OnClick="btnLogin_Click" CssClass="input-button">Login</asp:LinkButton>
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
