<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="error.aspx.cs" Inherits="PandemicSuppliesWebApp.UL.Pages.error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p><asp:Label ID="lblFeedback" runat="server" Text="Sorry, there was an error."></asp:Label></p>
            <br />
            <br />
            <asp:HyperLink runat="server" Text="Click here to go back to main page" NavigateUrl="main.aspx" />
        </div>
    </form>
</body>
</html>
