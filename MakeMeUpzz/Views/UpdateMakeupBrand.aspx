<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateMakeupBrand.aspx.cs" Inherits="MakeMeUpzz.Views.UpdateMakeupBrand" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MakeMeUpzz - Update Makeup Brand</title>
</head>
<body>
    <form id="UpdateMakeupBrand" runat="server">
        <h1>Update Makeup Brand</h1>
        <h1><%=Request.QueryString["id"] %></h1>
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
            <asp:Button ID="UpdateMakeupBrandButton" runat="server" Text="Update Makeup Brand" OnClick="UpdateMakeupBrandButton_Click"/>
        </div>

        <div>
            <asp:Button ID="ToManageMakeup" runat="server" Text="Back to Manage Makeup" OnClick="ToManageMakeup_Click"/>
        </div>

    </form>
</body>
</html>
