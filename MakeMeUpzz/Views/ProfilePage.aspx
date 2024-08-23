<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProfilePage.aspx.cs" Inherits="MakeMeUpzz.Views.ProfilePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MakeMeUpzz - Profile</title>
</head>
<body>
    <form id="ProfileInfo" runat="server">
        <h1>Profile</h1>
        <hr />

        <!-- User Profile Update Form -->
        <div>
            <h2>Update Profile</h2>
            <asp:Label ID="UsernameLabel" runat="server" Text="Username: "></asp:Label>
            <asp:TextBox ID="UsernameTextBox" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="EmailLabel" runat="server" Text="Email: "></asp:Label>
            <asp:TextBox ID="EmailTextBox" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="GenderLabel" runat="server" Text="Gender: "></asp:Label>
            <asp:RadioButton ID="GenderMaleRadioButton" runat="server" GroupName="Gender" Text="Male" />
            <asp:RadioButton ID="GenderFemaleRadioButton" runat="server" GroupName="Gender" Text="Female" />
            <br />
            <asp:Label ID="DOBLabel" runat="server" Text="Date of Birth: "></asp:Label>
            <asp:TextBox ID="DOBTextBox" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            <asp:Button ID="UpdateProfileButton" runat="server" Text="Update Profile" OnClick="UpdateProfileButton_Click" />
            <asp:Label ID="ProfileUpdateMessageLabel" runat="server" ForeColor="Red"></asp:Label>
        </div>

        <!-- Password Change Form -->
        <div>
            <h2>Change Password</h2>
            <asp:Label ID="OldPasswordLabel" runat="server" Text="Old Password: "></asp:Label>
            <asp:TextBox ID="OldPasswordTextBox" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <asp:Label ID="NewPasswordLabel" runat="server" Text="New Password: "></asp:Label>
            <asp:TextBox ID="NewPasswordTextBox" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <asp:Button ID="UpdatePasswordButton" runat="server" Text="Update Password" OnClick="UpdatePasswordButton_Click" />
            <asp:Label ID="PasswordUpdateMessageLabel" runat="server" ForeColor="Red"></asp:Label>
        </div>

        <br />
        <br />

        <asp:Button ID="BackToHomePage" runat="server" Text="Back to Home Page" OnClick="BackToHomePage_Click" />
    </form>
</body>
</html>
