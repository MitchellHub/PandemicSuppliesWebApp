<%@ Page Title="" Language="C#" MasterPageFile="~/UL/PagesMaster/Site1.master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.register" %>

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

                <h1>Register</h1>
                
                <%-- Name Input --%>
                <div class="input-field">
                    <%-- Feedback Label --%>
                <span class="input-error_message">
                    <asp:Label ID="lblFeedback" runat="server" Text="Feedback" Visible="false"></asp:Label>
                    <asp:HyperLink ID="linkResetPwd" runat="server" Text="Reset password?" NavigateUrl="~/UL/Pages/resetPassword.aspx" Visible="false"/>
                </span>
                    <br />
                    <label for="tbxName" class="input-label">Your name*</label>
                    <asp:TextBox ID="tbxName" runat="server" ToolTip="Please enter your name." CssClass="input-textbox"></asp:TextBox>
                    <br />
                    <span class="input-error_message">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbxName" ErrorMessage="Please enter your name." Display="Dynamic"></asp:RequiredFieldValidator>
                    </span>
                </div>

                <%-- Email Input --%>
                <div class="input-field">
                    <label for="tbxEmail" class="input-label">Email*</label>
                    <asp:TextBox ID="tbxEmail" runat="server" ToolTip="Please enter a valid email." CssClass="input-textbox"></asp:TextBox>
                    <br />
                    <span class="input-error_message">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxEmail" Display="Dynamic" ErrorMessage="Please enter a registered email."></asp:RequiredFieldValidator>
                        <%-- trigger event for leaving textbox --%>
                        <%-- Email validator: 1 @ >2 . >2 --%>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="tbxEmail" ErrorMessage="Please enter a valid email." Display="Dynamic" SetFocusOnError="true"></asp:RegularExpressionValidator>
                    </span>
                </div>

                <%-- Password1 Input --%>
                <div class="input-field">
                    <label for="tbxPassword1" class="input-label">Password*</label>
                    <asp:TextBox ID="tbxPassword1" runat="server" TextMode="Password" ToolTip="Please enter your password." CssClass="input-textbox"></asp:TextBox>
                    <span class="input-error_message">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password Required." ControlToValidate="tbxPassword1" ></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbxPassword1" Display="Dynamic" ErrorMessage="Minimum of 6 characters." ValidationExpression="^[\s\S]{6,}$"></asp:RegularExpressionValidator>
                    </span>
                </div>

                <%-- Password2 Input --%>
                <div class="input-field">
                    <label for="tbxPassword2" class="input-label">Re-enter Password*</label>
                    <asp:TextBox ID="tbxPassword2" runat="server" TextMode="Password" ToolTip="Please re-enter your password." CssClass="input-textbox"></asp:TextBox>
                    <br />
                    <span class="input-error_message">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please type your password again." ControlToValidate="tbxPassword2" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                        <br />
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="These passwords don't match." ControlToCompare="tbxPassword1" ControlToValidate="tbxPassword2" SetFocusOnError="true" ></asp:CompareValidator>
                    </span>
                </div>

                <%-- Register Button --%>
                <asp:LinkButton ID="btnRegister" runat="server" CausesValidation="true" OnClick="btnRegister_Click" CssClass="button">Register</asp:LinkButton>
                <br /><br />
                <span class="input-helper_text">
                        Already got an account?<br />
                        <asp:HyperLink ID="linkLogin" runat="server" Text="Click here to Login" NavigateURL="~/UL/Pages/login.aspx" />
                </span>
            </div>
        </div>
        <div class="grid-item"></div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
