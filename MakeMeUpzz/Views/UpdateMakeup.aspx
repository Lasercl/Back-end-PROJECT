<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateMakeup.aspx.cs" Inherits="MakeMeUpzz.Views.UpdateMakeup" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MakeMeUpzz - Update Makeup</title>
</head>
<body>
    <form id="UpdateMakeup" runat="server">
        <h1>Update Makeup</h1>
        <h1><%=Request.QueryString["id"] %></h1>
        <hr />

        <div>
            <asp:Label ID="MakeupNameLbl" runat="server" Text="Name"></asp:Label>
            <asp:TextBox ID="MakeupNameTb" runat="server"></asp:TextBox>
        </div>

        <div>
            <asp:Label ID="MakeupPriceLbl" runat="server" Text="Price"></asp:Label>
            <asp:TextBox ID="MakeupPriceTb" runat="server"></asp:TextBox>
        </div>

        <div>
            <asp:Label ID="MakeupWeightLbl" runat="server" Text="Weight"></asp:Label>
            <asp:TextBox ID="MakeupWeightTb" runat="server"></asp:TextBox>
        </div>

        <div>
            <asp:Label ID="MakeupTypeID" runat="server" Text="Type ID"></asp:Label>
            <asp:TextBox ID="MakeupTypeIDTb" runat="server"></asp:TextBox>
        </div>

        <div>
            <asp:Label ID="MakeupBrandID" runat="server" Text="Brand ID"></asp:Label>
            <asp:TextBox ID="MakeupBrandIDTb" runat="server"></asp:TextBox>
        </div>

        <asp:Button ID="UpdateMakeupButton" runat="server" Text="Update Makeup" OnClick="UpdateMakeupButton_Click" />

    </form>
</body>
</html>
