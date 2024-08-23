<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="WebApplicationFrontEnd.Views.RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MakeMeUpzz - Register</title>
</head>
<body>
    <form id="RegisterForm" runat="server">
        <h1>Register</h1>
        <hr />

        <div>
            <asp:Label ID="UsernameLbl" runat="server" Text="Username"></asp:Label>
            <asp:TextBox ID="UsernameTb" runat="server"></asp:TextBox>
        </div>

        <br />

        <div>
            <asp:Label ID="UserEmailLbl" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="UserEmailTb" runat="server"></asp:TextBox>
        </div>

        <br />

        <div>
            <asp:Label ID="DOBLbl" runat="server" Text="Date of Birth"></asp:Label>
            <asp:TextBox ID="DOBTb" runat="server" TextMode="Date"></asp:TextBox>
        </div>

        <br />

        <div>
            <asp:Label ID="UserGenderLbl" runat="server" Text="Gender"></asp:Label>
            <asp:RadioButtonList ID="GenderRBL" runat="server">
                <asp:ListItem Value="Male">Male</asp:ListItem>
                <asp:ListItem Value="Female">Female</asp:ListItem>
            </asp:RadioButtonList>
        </div>

        <br />

        <div>
            <asp:Label ID="UserRoleLbl" runat="server" Text="Role"></asp:Label>
            <asp:DropDownList ID="RoleDDL" runat="server">
                <asp:ListItem Value="User">User</asp:ListItem>
                <asp:ListItem Value="Admin">Admin</asp:ListItem>
            </asp:DropDownList>
        </div>

        <br />

        <div>
            <asp:Label ID="UserPasswordLbl" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="UserPasswordTb" runat="server"></asp:TextBox>
        </div>

        <br />

        <div>
            <asp:Label ID="UserPassword2Lbl" runat="server" Text="Password Confirmation"></asp:Label>
            <asp:TextBox ID="UserPassword2Tb" runat="server"></asp:TextBox>
        </div>

        <br />

        <div>
            <asp:Label ID="ErrorLabel" runat="server" ForeColor="Red" />
        </div>

        <asp:Button ID="RegisterButton" runat="server" Text="Register" OnClick="RegisterButton_Click" />

        <div>
            <asp:LinkButton ID="LoginRedirect" runat="server" onclick="LoginRedirect_Click" Text="Already have an account? Login here!" />
        </div>
    </form>
</body>
</html>