<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="WebApplicationFrontEnd.Views.RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MakeMeUpzz - Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>

<body style="background: linear-gradient(135deg, #f8bbd0, #e1bee7, #f3e5f5); min-height: 100vh;">
    <form id="RegisterForm" runat="server" class="d-flex justify-content-center align-items-center py-5">
        <div class="card shadow-lg border-0 rounded-4 p-4" style="width: 450px; background-color: #ffffff;">
            <div class="card-header text-center rounded-4 mb-3" style="background-color: #ba68c8; color: white;">
                <h3 class="fw-bold mb-0">Create Your Account</h3>
                <small class="text-light">Join MakeMeUpzz today 💄</small>
            </div>

            <div class="card-body">
                <div class="mb-3">
                    <label for="UsernameTb" class="form-label fw-semibold" style="color: #8e24aa;">Username</label>
                    <asp:TextBox ID="UsernameTb" runat="server" CssClass="form-control rounded-pill border-1" placeholder="Enter your username"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <label for="UserEmailTb" class="form-label fw-semibold" style="color: #8e24aa;">Email</label>
                    <asp:TextBox ID="UserEmailTb" runat="server" CssClass="form-control rounded-pill border-1" placeholder="example@email.com"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <label for="DOBTb" class="form-label fw-semibold" style="color: #8e24aa;">Date of Birth</label>
                    <asp:TextBox ID="DOBTb" runat="server" TextMode="Date" CssClass="form-control rounded-pill border-1"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-semibold" style="color: #8e24aa;">Gender</label>
                    <asp:RadioButtonList ID="GenderRBL" runat="server" RepeatDirection="Horizontal" CssClass="d-flex gap-4">
                        <asp:ListItem Value="Male">Male</asp:ListItem>
                        <asp:ListItem Value="Female">Female</asp:ListItem>
                    </asp:RadioButtonList>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-semibold" style="color: #8e24aa;">Role</label>
                    <asp:DropDownList ID="RoleDDL" runat="server" CssClass="form-select rounded-pill border-1">
                        <asp:ListItem Value="User">User</asp:ListItem>
                        <asp:ListItem Value="Admin">Admin</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="mb-3">
                    <label for="UserPasswordTb" class="form-label fw-semibold" style="color: #8e24aa;">Password</label>
                    <asp:TextBox ID="UserPasswordTb" runat="server" TextMode="Password" CssClass="form-control rounded-pill border-1" placeholder="Enter password"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <label for="UserPassword2Tb" class="form-label fw-semibold" style="color: #8e24aa;">Confirm Password</label>
                    <asp:TextBox ID="UserPassword2Tb" runat="server" TextMode="Password" CssClass="form-control rounded-pill border-1" placeholder="Confirm your password"></asp:TextBox>
                </div>

                <div class="text-center mb-3">
                    <asp:Label ID="ErrorLabel" runat="server" ForeColor="Red" CssClass="fw-semibold"></asp:Label>
                </div>

                <div class="d-grid">
                    <asp:Button ID="RegisterButton" runat="server" Text="Register" CssClass="btn text-white rounded-pill fw-semibold py-2" Style="background-color: #ec407a; border: none;" OnClick="RegisterButton_Click" />
                </div>

                <div class="text-center mt-3">
                    <asp:LinkButton ID="LoginRedirect" runat="server" CssClass="text-decoration-none fw-semibold" Style="color: #8e24aa;" OnClick="LoginRedirect_Click">
                        Already have an account? <span class="text-primary">Login here!</span>
                    </asp:LinkButton>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
