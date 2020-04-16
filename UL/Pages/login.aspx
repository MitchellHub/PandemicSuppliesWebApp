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
                    <asp:Label ID="lblFeedback" runat="server" Text="Label" Visible="false"></asp:Label>
                    <br />
                    <label for="tbxEmail" class="input-label">Email*</label>
                    <asp:TextBox ID="tbxEmail" runat="server" ToolTip="Please enter a registered email." CssClass="input-textbox"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxEmail" Display="Dynamic" ErrorMessage="Please enter a registered email." CssClass="error-message"></asp:RequiredFieldValidator>
                    <%-- trigger event for leaving textbox --%>
                    <%-- Email validator: 1 @ >2 . >2 --%>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="tbxEmail" ErrorMessage="Please enter a valid email." Display="Dynamic" SetFocusOnError="true" CssClass="error-message"></asp:RegularExpressionValidator>
                </div>
                <%-- Password Input --%>
                <div class="input-field">
                    <label for="tbxPassword" class="input-label">Password*</label>
                    <asp:TextBox ID="tbxPassword" runat="server" TextMode="Password" ToolTip="Please enter your password." CssClass="input-textbox"></asp:TextBox>
                    <span class="input-helper_text">
                        <a href="#">Forgotten your password?</a>
                    </span>
                </div>
                <asp:LinkButton ID="btnLogin" runat="server" CausesValidation="true" OnClick="btnLogin_Click">Login</asp:LinkButton>
                <br />
                <br />
                <span class="input-helper_text">
                    <p>Haven't got an account yet?<br />
                <a href="#">Click here to register</a></p>

                </span>
            </div>
        </div>
        <div class="grid-item"></div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>