<%@ Page Title="" Language="C#" MasterPageFile="~/UL/Pages/Admin/Site1Admin.Master" AutoEventWireup="true" CodeBehind="adminProducts.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.Admin.adminProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h2>Edit Products</h2>
    <hr />
    <asp:Label ID="lblSearchBy" runat="server" Text="Search by "></asp:Label>

    <asp:DropDownList ID="lstSearchBy" runat="server">
        <asp:ListItem Selected="True" Value="ProductID">ProductID</asp:ListItem>
        <asp:ListItem Value="ProductName">Name</asp:ListItem>
        <asp:ListItem Value="IsAvailable">Availability</asp:ListItem>
        <asp:ListItem Value="IsActive">Active</asp:ListItem>
    </asp:DropDownList>

    <asp:TextBox ID="tbxSearchBy" runat="server"></asp:TextBox>

    <asp:Button ID="btnSearchBy" runat="server" Text="Search" OnClick="btnSearchBy_Click" />
    <br />
    <br />
    <asp:Button ID="btnDisplayAll" runat="server" Text="Display all products" OnClick="btnDisplayAll_Click" />
    <br />
    <br />
    <hr />

    <br />
    <p>
        <asp:Label ID="lblProductsGridViewFeedback" runat="server" Text="Displaying all products"></asp:Label>
    </p>
    <asp:GridView ID="gvProducts" HeaderStyle-BackColor="#2d545e" HeaderStyle-ForeColor="White"
        runat="server" AutoGenerateColumns="False" OnRowCommand="gvProducts_RowCommand">
        <Columns>
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" ItemStyle-Width="" />
            <asp:BoundField DataField="ProductName" HeaderText="ProductName" ItemStyle-Width="" />
            <asp:BoundField DataField="ProductDesc" HeaderText="ProductDesc" ItemStyle-Width="" />
            <asp:BoundField DataField="ProductPrice" HeaderText="ProductPrice" ItemStyle-Width="" />
            <asp:BoundField DataField="StockLevel" HeaderText="StockLevel" ItemStyle-Width="" />
            <asp:BoundField DataField="IsAvailable" HeaderText="IsAvailable" ItemStyle-Width="" />
            <asp:BoundField DataField="ImgSource" HeaderText="ImgSource" ItemStyle-Width="" />
            <asp:BoundField DataField="IsActive" HeaderText="IsActive" ItemStyle-Width="" />
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
    <p>
        <asp:Label runat="server" ID="lblEditProduct" Text="Editing: " />
    </p>
    <br />
    <asp:Label runat="server" ID="lblEditProductFeedback" Text="" Visible="false" ForeColor="green"/>
    <br />
    <br />
    <asp:Label runat="server" ID="lblProductID" Text="ProductID: " /><br /><br />
    
    <asp:Label runat="server" ID="lblProductName" Text="ProductName: " /><asp:TextBox runat="server" ID="tbxProductName" Text="" Width="500"/><br /><br />

    <asp:Label runat="server" ID="lblProductDesc" Text="ProductDesc: "/><asp:TextBox runat="server" ID="tbxProductDesc" Text="" Width="500"/><br /><br />

    <asp:Label runat="server" ID="lblProductPrice" Text="ProductPrice: " /><asp:TextBox runat="server" ID="tbxProductPrice" Text="" Width="500"/><br /><br />

    <asp:Label runat="server" ID="lblStockLevel" Text="StockLevel: " /><asp:TextBox runat="server" ID="tbxStockLevel" Text="" Width="500"/><br /><br />

    <asp:Label runat="server" ID="lblIsAvailable" Text="IsAvailable: "/><asp:CheckBox runat="server" ID="cbxIsAvailable" /><br /><br />
    
    <asp:Label runat="server" ID="lblImgSource" Text="Img Source: " /><asp:TextBox runat="server" ID="tbxImgSource" Text="" Width="500"/><br /><br />

    <asp:Label runat="server" ID="lblIsActive" Text="Active: " /><asp:CheckBox runat="server" ID="cbxIsActive" /><br /><br />

    <asp:Button runat="server" ID="btnConfirmEdit" Text="Edit product" OnClick="btnConfirmEdit_Click"/>

    <asp:Button runat="server" ID="btnCancel" Text="Cancel" OnClick="btnCancel_Click"/>
</asp:Content>
