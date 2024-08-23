using MakeMeUpzz.Handlers;
using MakeMeUpzz.Models;
using MakeMeUpzz.Modules;
using System;
using System.Web;

namespace MakeMeUpzz.Views {
    public partial class ProfilePage : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                HttpCookie userCookie = Request.Cookies["UserID"];
                int userId;

                if (userCookie != null && Int32.TryParse(userCookie.Value, out userId)) {
                    LoadUserProfile(userId);
                }
                else {
                    Response.Redirect("~/Views/LoginPage.aspx");
                }
            }
        }

        private void LoadUserProfile(int userId) {
            Response<User> userResponse = UserHandler.getUserByID(userId);

            if (userResponse.Success) {
                UsernameTextBox.Text = userResponse.Payload.Username;
                EmailTextBox.Text = userResponse.Payload.UserEmail;
                string gender = userResponse.Payload.UserGender;

                if (gender == "Male") {
                    GenderMaleRadioButton.Checked = true;
                }
                else if (gender == "Female") {
                    GenderFemaleRadioButton.Checked = true;
                }
            }
            else {
                ProfileUpdateMessageLabel.Text = "Failed to load user profile.";
            }
        }

        protected void UpdateProfileButton_Click(object sender, EventArgs e) {
            HttpCookie userCookie = Request.Cookies["UserID"];
            int userId;

            if (userCookie != null && Int32.TryParse(userCookie.Value, out userId)) {
                String newUsername = UsernameTextBox.Text;
                String newEmail = EmailTextBox.Text;
                String newDOB = DOBTextBox.Text;
                String newGender = GenderMaleRadioButton.Checked ? "Male" : "Female";

                Response<User> userResponse = UserHandler.getUserByID(userId);

                if (userResponse.Success) {
                    User user = userResponse.Payload;
                    user.Username = newUsername;
                    user.UserEmail = newEmail;
                    user.UserDOB = Convert.ToDateTime(newDOB);
                    user.UserGender = newGender;

                    Response<string> updateResponse = UserHandler.updateUserProfile(user);

                    if (updateResponse.Success) {
                        ProfileUpdateMessageLabel.Text = "Profile updated successfully.";
                    }
                    else {
                        ProfileUpdateMessageLabel.Text = updateResponse.Message;
                    }
                }
                else {
                    ProfileUpdateMessageLabel.Text = "Failed to retrieve user data.";
                }
            }
            else {
                ProfileUpdateMessageLabel.Text = "User not logged in.";
            }
        }

        protected void UpdatePasswordButton_Click(object sender, EventArgs e) {
            HttpCookie userCookie = Request.Cookies["UserID"];
            int userId;

            if (userCookie != null && Int32.TryParse(userCookie.Value, out userId)) {
                String oldPassword = OldPasswordTextBox.Text;
                String newPassword = NewPasswordTextBox.Text;

                Response<User> userResponse = UserHandler.getUserByID(userId);

                if (userResponse.Success) {
                    User user = userResponse.Payload;

                    if (user.UserPassword == oldPassword) {
                        user.UserPassword = newPassword;

                        Response<string> updateResponse = UserHandler.updateUserPassword(user);

                        if (updateResponse.Success) {
                            PasswordUpdateMessageLabel.Text = "Password updated successfully.";
                        }
                        else {
                            PasswordUpdateMessageLabel.Text = updateResponse.Message;
                        }
                    }
                    else {
                        PasswordUpdateMessageLabel.Text = "Old password is incorrect.";
                    }
                }
                else {
                    PasswordUpdateMessageLabel.Text = "Failed to retrieve user data.";
                }
            }
            else {
                PasswordUpdateMessageLabel.Text = "User not logged in.";
            }
        }

        protected void BackToHomePage_Click(object sender, EventArgs e) {
            Response.Redirect("~/Views/HomePage.aspx");
        }
    }
}
