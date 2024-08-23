<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="MakeMeUpzz.Views.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MakeMeUpzz - Login</title>
        <link href="../style/LoginPage.css" rel="stylesheet"/>

</head>
<body>
    <form id="form1" runat="server">
        <h1>Login</h1>
        <hr />

        <div>
            <asp:TextBox ID="UsernameTb" runat="server" Placeholder="Username" CssClass="inputuserpassword"/>
        </div>

        <div>
            <asp:TextBox ID="UserPasswordTb" runat="server" Placeholder="Password" TextMode="Password" CssClass="inputuserpassword" />
        </div>

        <br />
        <div>
            <asp:Button ID="LoginBtn" runat="server" Text="Login" OnClick="LoginBtn_Click" />
        </div>

        <div>
            <asp:Label ID="ErrorLabel" runat="server" ForeColor="Red" />
        </div>

        <div>
            <asp:LinkButton ID="RegisterRedirect" runat="server" OnClick="RegisterRedirect_Click" Text="Don't have an account? Register here!" />
        </div>
    </form>
</body>
</html>