using MakeMeUpzz.Handlers;
using MakeMeUpzz.Models;
using MakeMeUpzz.Modules;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MakeMeUpzz.Views {
    public partial class HomePage : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                HttpCookie userCookie = Request.Cookies["UserID"];
                int id;

                if (userCookie != null && Int32.TryParse(userCookie.Value, out id)) {
                    Response<User> userResponse = UserHandler.getUserByID(id);

                    if (userResponse.Success) {
                        WelcomeLbl.Text = "Welcome back, " + userResponse.Payload.Username;
                        RoleLbl.Text = "Current Role: " + userResponse.Payload.UserRole;

                        PopulateNavigation(userResponse.Payload.UserRole);

                        if (userResponse.Payload.UserRole == "Admin") {
                            Response<List<User>> adminResponse = UserHandler.getAllUsers(userResponse.Payload);

                            if (adminResponse.Success) {
                                UserGV.DataSource = adminResponse.Payload;
                                UserGV.DataBind();
                            }
                            else {
                                MessageLbl.Text = adminResponse.Message;
                            }
                        }
                    }
                    else {
                        Response.Redirect("~/Views/LoginPage.aspx");
                    }
                }
                else {
                    Response.Redirect("~/Views/LoginPage.aspx");
                }
            }
        }

        private class NavLink {
            public string Title { get; set; }
            public string Url { get; set; }
        }

        private void PopulateNavigation(string role) {
            var navLinks = new List<NavLink>();

            if (role == "Admin") {
                navLinks.Add(new NavLink { Title = "Manage Makeup", Url = "ManageMakeup.aspx" });
                navLinks.Add(new NavLink { Title = "Order Queue", Url = "HandleTransaction.aspx" });
                navLinks.Add(new NavLink { Title = "Profile", Url = "ProfilePage.aspx" });
                navLinks.Add(new NavLink { Title = "Transaction Report", Url = "TransactionReport.aspx" });
                navLinks.Add(new NavLink { Title = "Transaction History", Url = "TransactionHistory.aspx" });
            }
            else if (role == "User") {
                navLinks.Add(new NavLink { Title = "Order Makeup", Url = "OrderMakeup.aspx" });
                navLinks.Add(new NavLink { Title = "Transaction History", Url = "TransactionHistory.aspx" });
                navLinks.Add(new NavLink { Title = "Profile", Url = "ProfilePage.aspx" });
            }

            foreach (var link in navLinks) {
                System.Diagnostics.Debug.WriteLine("NavLink: " + link.Title + " - " + link.Url);
            }

            NavRepeater.DataSource = navLinks;
            NavRepeater.DataBind();
        }

        protected void LogoutBtn_Click(object sender, EventArgs e) {
            if (Request.Cookies["UserID"] != null) {
                HttpCookie userCookie = new HttpCookie("UserID");
                userCookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(userCookie);
            }

            Session.Clear();
            Response.Redirect("~/Views/LoginPage.aspx");
        }
    }
}
