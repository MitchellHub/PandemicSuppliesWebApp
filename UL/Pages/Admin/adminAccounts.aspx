<%@ Page Title="" Language="C#" MasterPageFile="~/UL/Pages/Admin/Site1Admin.Master" AutoEventWireup="true" CodeBehind="adminAccounts.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.Admin.adminAccounts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h2>Edit User Accounts</h2>
    <hr />
    <br />
    <asp:Label ID="lblSearchBy" runat="server" Text="Search by "></asp:Label>
    <asp:DropDownList ID="lstSearchBy" runat="server">
        <asp:ListItem Selected="True" Value="UserID">UserID</asp:ListItem>
        <asp:ListItem Value="Email">Email</asp:ListItem>
        <asp:ListItem Value="IsActive">IsActive</asp:ListItem>
        <asp:ListItem Value="Name">Name</asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="tbxSearchBy" runat="server"></asp:TextBox>
    <asp:Button ID="btnSearchBy" runat="server" Text="Search" OnClick="btnSearchBy_Click" />
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
    <asp:GridView ID="gvAccounts" HeaderStyle-BackColor="#2d545e" HeaderStyle-ForeColor="White"
        runat="server" AutoGenerateColumns="False" OnRowCommand="gvAccounts_RowCommand">
        <Columns>
            <asp:BoundField DataField="UserID" HeaderText="UserID" ItemStyle-Width="100" />
            <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-Width="150" />
            <asp:BoundField DataField="IsActive" HeaderText="IsActive" ItemStyle-Width="150" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button Text="View" runat="server" CommandName="View" CommandArgument="<%# Container.DataItemIndex %>" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <hr />

    <br />
    <asp:Label ID="lblUserIDDisplay" runat="server" Text="UserID: not selected"></asp:Label>
    <br />
    <asp:Label ID="lblEmailDisplay" runat="server" Text="Email: not selected"></asp:Label>
    <br />
    <br />
    <asp:Button ID="btnActivate" runat="server" Text="Suspend Account" />
    <asp:Button ID="btnViewInvoices" runat="server" Text="View Invoices" OnClick="btnViewInvoices_Click" />
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
