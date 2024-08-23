<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsertMakeup.aspx.cs" Inherits="MakeMeUpzz.Views.InsertMakeup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MakeMeUpzz - Insert Makeup</title>
</head>
<body>
    <form id="InsertMakeup" runat="server">
        <h1>Insert Makeup</h1>

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

        <div>
            <asp:Label ID="ErrorLabel" runat="server" ForeColor="Red" />
        </div>

        <asp:Button ID="InsertMakeupButton" runat="server" Text="Insert" OnClick="InsertMakeupButton_Click" />

        <div>
            <asp:Button ID="ToManageMakeup" runat="server" Text="Back to Manage Makeup" OnClick="ToManageMakeup_Click"/>
        </div>
    </form>
</body>
</html>
