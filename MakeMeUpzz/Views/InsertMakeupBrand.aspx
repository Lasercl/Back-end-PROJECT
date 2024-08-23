<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsertMakeupBrand.aspx.cs" Inherits="MakeMeUpzz.Views.InsertMakeupBrand" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MakeMeUpzz - Insert Makeup Brand</title>
</head>
<body>
    <form id="InsertMakeupBrand" runat="server">
        <h1>Insert Makeup Brand</h1>
        <hr />

        <div>
            <asp:Label ID="MakeupBrandNameLbl" runat="server" Text="Makeup Brand Name"></asp:Label>
            <asp:TextBox ID="MakeupBrandNameTb" runat="server"></asp:TextBox>
        </div>

        <div>
            <asp:Label ID="MakeupBrandRatingLbl" runat="server" Text="Makeup Brand Rating"></asp:Label>
            <asp:TextBox ID="MakeupBrandRatingTb" runat="server"></asp:TextBox>
        </div>

        <div>
            <asp:Label ID="ErrorLabel" runat="server" ForeColor="Red" />
        </div>

        <div>
            <asp:Button ID="InserMakeupBrandButton" runat="server" Text="Insert Makeup Brand" OnClick="InserMakeupBrandButton_Click" />
        </div>

        <div>
            <asp:Button ID="ToManageMakeup" runat="server" Text="Back to Manage Makeup" OnClick="ToManageMakeup_Click" />
        </div>

    </form>
</body>
</html>
