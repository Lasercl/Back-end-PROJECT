<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateMakeupType.aspx.cs" Inherits="MakeMeUpzz.Views.UpdateMakeupType" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MakeMeUpzz - Update Makeup Type</title>
</head>
<body>
    <form id="UpdateMakeupType" runat="server">
        <h1>Update Makeup Type</h1>
        <h1><%=Request.QueryString["id"] %></h1>
        <hr />

        <div>
            <asp:Label ID="MakeupTypeNameLbl" runat="server" Text="Makeup Type Name"></asp:Label>
            <asp:TextBox ID="MakeupTypeNameTb" runat="server"></asp:TextBox>
        </div>

        <div>
            <asp:Label ID="ErrorLabel" runat="server" ForeColor="Red" />
        </div>

        <div>
            <asp:Button ID="UpdateMakeupTypeButton" runat="server" Text="Update Makeup Type" OnClick="UpdateMakeupTypeButton_Click" />
        </div>

        <div>
            <asp:Button ID="ToManageMakeup" runat="server" Text="Back to Manage Makeup" OnClick="ToManageMakeup_Click" />
        </div>

    </form>
</body>
</html>
