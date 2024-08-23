using MakeMeUpzz.Models;
using MakeMeUpzz.Modules;
using System;
using System.Web;
using System.Web.UI;

namespace MakeMeUpzz.Views {
    public partial class LoginPage : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            HttpCookie userCookie = Request.Cookies["UserID"];
            if (userCookie != null) {
                int id;
                if (Int32.TryParse(userCookie.Value, out id)) {
                    Response.Redirect("~/Views/HomePage.aspx?id=" + id);
                }
            }
        }

        protected void LoginBtn_Click(object sender, EventArgs e) {
            String Username = UsernameTb.Text;
            String UserPassword = UserPasswordTb.Text;

            Response<User> response = UserController.Login(Username, UserPassword);

            if (response.Success) {
                HttpCookie userCookie = new HttpCookie("UserID", response.Payload.UserID.ToString());
                userCookie.Expires = DateTime.Now.AddHours(1); // Cookie expiration time
                Response.Cookies.Add(userCookie);

                Response.Redirect("~/Views/HomePage.aspx?id=" + response.Payload.UserID);
            }
            else {
                ErrorLabel.Text = response.Message;
            }
        }

        protected void RegisterRedirect_Click(object sender, EventArgs e) {
            Response.Redirect("~/Views/RegisterPage.aspx");
        }
    }
}
