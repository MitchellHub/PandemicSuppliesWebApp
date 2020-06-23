<%@ Page Title="" Language="C#" MasterPageFile="~/UL/Pages/Admin/Site1Admin.Master" AutoEventWireup="true" CodeBehind="adminAccounts.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.Admin.adminAccounts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h2>User Accounts</h2>
    <hr />
    <br />
    <asp:Label ID="lblSearchBy" runat="server" Text="Search by "></asp:Label>
    <asp:DropDownList ID="lstSearchBy" runat="server">
        <asp:ListItem Selected="True" Value="UserID">UserID</asp:ListItem>
        <%--<asp:ListItem Value="Email">Email</asp:ListItem>--%>
        <%--<asp:ListItem Value="IsActive">IsActive</asp:ListItem>--%>
        <%--<asp:ListItem Value="Name">Name</asp:ListItem>--%>
    </asp:DropDownList>
    <asp:TextBox ID="tbxSearchBy" runat="server" ValidationGroup="SearchValidation" CausesValidation="true"/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
        runat="server" 
        ErrorMessage="Must enter a value" 
        ValidationGroup="SearchValidation"
        Display="Dynamic"
        ControlToValidate="tbxSearchBy" 
        CssClass="input-error_message" />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
        runat="server" 
        ErrorMessage="Value must be a number" 
        ValidationGroup="SearchValidation" 
        Display="Dynamic"
        ControlToValidate="tbxSearchBy"
        CssClass="input-error_message" 
        ValidationExpression="^[1-9]\d*$" />
    <asp:Button ID="btnSearchBy" runat="server" Text="Search" OnClick="btnSearchBy_Click" ValidationGroup="SearchValidation" CausesValidation="true" />
    <br />
    <br />
    <asp:Button ID="btnDisplayAll" runat="server" Text="Display All Accounts" OnClick="btnDisplayAll_Click" />
    <br />
    <br />
    <hr />

    <br />
    <p>
        <asp:Label ID="lblAccountsGridViewFeedback" runat="server" Text="Displaying All User Accounts"></asp:Label>
    </p>
    <br />
    <%-- Grid view for displaying accounts --%>
    <asp:GridView ID="gvAccounts" HeaderStyle-BackColor="#2d545e" HeaderStyle-ForeColor="White"
        runat="server" AutoGenerateColumns="False" OnRowCommand="gvAccounts_RowCommand" DataKeyNames="UserID">
        <Columns>
            <asp:BoundField DataField="UserID" HeaderText="UserID" ItemStyle-Width="100" InsertVisible="False" ReadOnly="True" SortExpression="UserID" />
            <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-Width="150" SortExpression="Email" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="CreateDate" HeaderText="CreateDate" SortExpression="CreateDate" />
            <asp:BoundField DataField="IsActive" HeaderText="IsActive" SortExpression="IsActive" />
            <asp:ButtonField CommandName="View" ButtonType="Link" Text="View Account Details" />
        </Columns>
    </asp:GridView>
    <br />
    <hr />

    <br />
    <asp:Label runat="server" Text="UserID: "></asp:Label>
    <asp:Label ID="lblUserIDValue" runat="server" Text="" />
    <br />
    <br />
    <asp:Label runat="server" Text="Email: "></asp:Label>
    <asp:Label ID="lblEmailValue" runat="server" Text="" />
    <br />
    <br />
    <asp:Label runat="server" Text="Name: " />
    <asp:Label ID="lblNameValue" runat="server" Text="" />
    <br />
    <br />
    <asp:Label runat="server" Text="Active: " />
    <asp:Label ID="lblIsActiveValue" runat="server" Text="" />
    <br />
    <br />
    <asp:Button ID="btnActivate" runat="server" Text="Activate Account" OnClick="btnActivate_Click" Visible="false"/>
    <asp:Button ID="btnDeActivate" runat="server" Text="Deactivate Account" OnClick="btnDeactivate_Click" Visible="false"/>
    <asp:Button ID="btnViewInvoices" runat="server" Text="View Invoices" OnClick="btnViewInvoices_Click" Visible="false" />
    <br />
    <br />
    <asp:Label ID="lblAccountsInfoFeedback" runat="server" Visible="false" />
    <br />
    <br />
    <hr />

    <br />
    <p><asp:Label ID="lblInvoiceGridViewFeedback" runat="server" Text=""></asp:Label></p>
    <br />
    <asp:GridView ID="gvInvoices" HeaderStyle-BackColor="#2d545e" HeaderStyle-ForeColor="White"
        runat="server" AutoGenerateColumns="False" Visible="False" OnRowCommand="gvInvoices_RowCommand">
        <Columns>
            <asp:BoundField DataField="InvoiceID" HeaderText="InvoiceID" ItemStyle-Width="100" />
            <asp:BoundField DataField="InvoiceDate" HeaderText="InvoiceDate" ItemStyle-Width="150" />
            <asp:BoundField DataField="InvoiceTotal" HeaderText="InvoiceTotal" ItemStyle-Width="150" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button Text="View Items" runat="server" CommandName="ViewItems" CommandArgument="<%# Container.DataItemIndex %>" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <hr />

    <br />
    <p><asp:Label ID="lblInvoiceProductsGridViewFeedback" runat="server" Text="" Visible="false"></asp:Label></p>
    <br />

    <asp:GridView ID="gvInvoiceProducts" HeaderStyle-BackColor="#2d545e" HeaderStyle-ForeColor="White"
        runat="server" AutoGenerateColumns="False" Visible="False" OnRowCommand="gvInvoiceProducts_RowCommand">
        <Columns>
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" ItemStyle-Width="100" />
            <asp:BoundField DataField="ProductQuantity" HeaderText="ProductQuantity" ItemStyle-Width="150" />
            <asp:BoundField DataField="ProductSellPrice" HeaderText="ProductSellPrice" ItemStyle-Width="150" />
            <asp:HyperLinkField DataTextField="ProductName" HeaderText="ProductPage" DataNavigateUrlFields="ProductID" 
                DataNavigateUrlFormatString="adminProducts.aspx" />
            <%--<asp:HyperLinkField DataTextField="ProductName" HeaderText="ProductPage" DataNavigateUrlFields="ProductID" 
                DataNavigateUrlFormatString="adminProduct.aspx?ProductID={0}" />--%>
        </Columns>
    </asp:GridView>
</asp:Content>
