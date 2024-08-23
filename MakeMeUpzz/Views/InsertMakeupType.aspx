<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsertMakeupType.aspx.cs" Inherits="MakeMeUpzz.Views.InsertMakeupType" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MakeMeUpzz - Insert Makeup Type</title>
</head>
<body>
    <form id="InsertMakeupType" runat="server">
        <h1>Insert Makeup Type</h1>
        <hr />

        <div>
            <asp:Label ID="MakeupTypeNameLbl" runat="server" Text="Makeup Type Name"></asp:Label>
            <asp:TextBox ID="MakeupTypeNameTb" runat="server"></asp:TextBox>
        </div>

        <div>
            <asp:Label ID="ErrorLabel" runat="server" ForeColor="Red" />
        </div>

        <div>
            <asp:Button ID="InsertMakeupTypeButton" runat="server" Text="Insert Makeup Type" OnClick="InserMakeupTypeButton_Click" />
        </div>

        <div>
            <asp:Button ID="ToManageMakeup" runat="server" Text="Back to Manage Makeup" OnClick="ToManageMakeup_Click" />
        </div>

    </form>
</body>
</html>
