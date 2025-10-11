<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProfilePage.aspx.cs" Inherits="MakeMeUpzz.Views.ProfilePage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MakeMeUpzz - Profile</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>

<body style="background: linear-gradient(135deg, #f8bbd0, #e1bee7, #f3e5f5); min-height: 100vh;">
    <form id="ProfileInfo" runat="server" class="container py-5">

        <!-- HEADER -->
        <div class="text-center mb-5">
            <h1 class="fw-bold" style="color:#8e24aa;">Profile</h1>
            <hr class="mx-auto" style="width:100px; border:2px solid #f8bbd0; opacity:0.8;" />
        </div>

        <!-- UPDATE PROFILE CARD -->
        <div class="card border-0 shadow-lg rounded-4 mb-5">
            <div class="card-header text-white text-center fw-semibold fs-5" style="background-color:#ba68c8;">
                Update Profile
            </div>
            <div class="card-body bg-white rounded-bottom-4 p-4">
                <div class="mb-3">
                    <asp:Label ID="UsernameLabel" runat="server" Text="Username:" CssClass="form-label fw-semibold text-secondary"></asp:Label>
                    <asp:TextBox ID="UsernameTextBox" runat="server" CssClass="form-control rounded-pill text-center" />
                </div>

                <div class="mb-3">
                    <asp:Label ID="EmailLabel" runat="server" Text="Email:" CssClass="form-label fw-semibold text-secondary"></asp:Label>
                    <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control rounded-pill text-center" />
                </div>

                <div class="mb-3">
                    <asp:Label ID="GenderLabel" runat="server" Text="Gender:" CssClass="form-label fw-semibold text-secondary d-block"></asp:Label>
                    <div class="form-check form-check-inline">
                        <asp:RadioButton ID="GenderMaleRadioButton" runat="server" GroupName="Gender" Text="Male" CssClass="form-check-input" />
                        <label class="form-check-label">Male</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <asp:RadioButton ID="GenderFemaleRadioButton" runat="server" GroupName="Gender" Text="Female" CssClass="form-check-input" />
                        <label class="form-check-label">Female</label>
                    </div>
                </div>

                <div class="mb-4">
                    <asp:Label ID="DOBLabel" runat="server" Text="Date of Birth:" CssClass="form-label fw-semibold text-secondary"></asp:Label>
                    <asp:TextBox ID="DOBTextBox" runat="server" TextMode="Date" CssClass="form-control rounded-pill text-center" />
                </div>

                <div class="text-center">
                    <asp:Button ID="UpdateProfileButton" runat="server" Text="Update Profile" 
                        OnClick="UpdateProfileButton_Click"
                        CssClass="btn text-white fw-semibold rounded-pill px-4 py-2 shadow-sm"
                        style="background-color:#ec407a; border:none;" />
                </div>

                <div class="text-center mt-3">
                    <asp:Label ID="ProfileUpdateMessageLabel" runat="server" ForeColor="Red" CssClass="fw-semibold"></asp:Label>
                </div>
            </div>
        </div>

        <!-- CHANGE PASSWORD CARD -->
        <div class="card border-0 shadow-lg rounded-4 mb-5">
            <div class="card-header text-white text-center fw-semibold fs-5" style="background-color:#ab47bc;">
                Change Password
            </div>
            <div class="card-body bg-white rounded-bottom-4 p-4">
                <div class="mb-3">
                    <asp:Label ID="OldPasswordLabel" runat="server" Text="Old Password:" CssClass="form-label fw-semibold text-secondary"></asp:Label>
                    <asp:TextBox ID="OldPasswordTextBox" runat="server" TextMode="Password" CssClass="form-control rounded-pill text-center" />
                </div>

                <div class="mb-4">
                    <asp:Label ID="NewPasswordLabel" runat="server" Text="New Password:" CssClass="form-label fw-semibold text-secondary"></asp:Label>
                    <asp:TextBox ID="NewPasswordTextBox" runat="server" TextMode="Password" CssClass="form-control rounded-pill text-center" />
                </div>

                <div class="text-center">
                    <asp:Button ID="UpdatePasswordButton" runat="server" Text="Update Password" 
                        OnClick="UpdatePasswordButton_Click"
                        CssClass="btn text-white fw-semibold rounded-pill px-4 py-2 shadow-sm"
                        style="background-color:#ec407a; border:none;" />
                </div>

                <div class="text-center mt-3">
                    <asp:Label ID="PasswordUpdateMessageLabel" runat="server" ForeColor="Red" CssClass="fw-semibold"></asp:Label>
                </div>
            </div>
        </div>

        <!-- BACK BUTTON -->
        <div class="text-center">
            <asp:Button ID="BackToHomePage" runat="server" Text="Back to Home Page"
                OnClick="BackToHomePage_Click"
                CssClass="btn fw-semibold rounded-pill px-4 py-2 text-white shadow-sm"
                style="background-color:#8e24aa; border:none;" />
        </div>

    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
