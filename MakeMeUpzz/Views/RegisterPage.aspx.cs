using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MakeMeUpzz.Controllers;
using MakeMeUpzz.Models;
using MakeMeUpzz.Modules;
using MakeMeUpzz.Repositories;
using MakeMeUpzz.Handlers;

namespace WebApplicationFrontEnd.Views {
    public partial class RegisterPage : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void RegisterButton_Click(object sender, EventArgs e) {
            int UserID = UserRepository.getNewID();
            String Username = UsernameTb.Text;
            String UserEmail = UserEmailTb.Text;
            DateTime UserDOB = Convert.ToDateTime(DOBTb.Text);
            String UserGender = GenderRBL.SelectedValue;
            String UserRole = RoleDDL.SelectedValue;
            String UserPassword = UserPasswordTb.Text;
            String UserPassword2 = UserPassword2Tb.Text;
           

            Response<User> response = UserController.Register(UserID, Username, UserEmail,
                UserDOB, UserGender, UserRole, UserPassword, UserPassword2);

            if (response.Success) {
                Response.Redirect("~/Views/LoginPage.aspx");
            }
            else {
                ErrorLabel.Text = response.Message;
            }
        }

        protected void LoginRedirect_Click(object sender, EventArgs e) {
            Response.Redirect("~/Views/LoginPage.aspx");
        }
    }
}