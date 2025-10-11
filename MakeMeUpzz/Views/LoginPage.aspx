<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="MakeMeUpzz.Views.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MakeMeUpzz - Login</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>

<body class="bg-gradient" style="background: linear-gradient(135deg, #f8bbd0, #e1bee7, #f3e5f5); min-height: 100vh;">
    <form id="form1" runat="server" class="d-flex justify-content-center align-items-center vh-100">
        <div class="card shadow-lg border-0 rounded-4" style="max-width: 400px; width: 100%;">
            <div class="card-body p-4">
                <h1 class="text-center text-purple fw-bold mb-3" style="color:#9c27b0;">Login</h1>
                <hr class="border border-pink opacity-75 mb-4" />

                <div class="mb-3">
                    <asp:TextBox ID="UsernameTb" runat="server" Placeholder="Username" CssClass="form-control rounded-3 border-2 border-light" />
                </div>

                <div class="mb-3">
                    <asp:TextBox ID="UserPasswordTb" runat="server" Placeholder="Password" TextMode="Password" CssClass="form-control rounded-3 border-2 border-light" />
                </div>

                <div class="d-grid mb-3">
                    <asp:Button ID="LoginBtn" runat="server" Text="Login" OnClick="LoginBtn_Click"
                        CssClass="btn btn-pink fw-semibold text-white rounded-3"
                        style="background-color:#ec407a; border:none;" />
                </div>

                <div class="text-center">
                    <asp:Label ID="ErrorLabel" runat="server" ForeColor="Red" CssClass="fw-semibold" />
                </div>

                <div class="text-center mt-3">
                    <asp:LinkButton ID="RegisterRedirect" runat="server"
                        OnClick="RegisterRedirect_Click"
                        CssClass="link-opacity-75 link-underline-opacity-0 link-underline-opacity-100-hover fw-medium"
                        Text="Don't have an account? Register here!"
                        style="color:#8e24aa;" />
                </div>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
