using MakeMeUpzz.Controllers;
using MakeMeUpzz.Handlers;
using MakeMeUpzz.Models;
using MakeMeUpzz.Modules;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MakeMeUpzz.Views {
    public partial class TransactionHistory : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                HttpCookie userCookie = Request.Cookies["UserID"];
                int id;

                if (userCookie != null && Int32.TryParse(userCookie.Value, out id)) {
                    Response<User> response = UserHandler.getUserByID(id);
                    if (response.Success) {
                        TransactionController transactionController = new TransactionController();
                        List<TransactionHeader> transactionList;

                        // If "Admin", get all transaction(s)
                        if (response.Payload.UserRole == "Admin") {
                            transactionList = transactionController.GetAllTransaction();

                        }
                        // If "User", get the transaction(s) that have been made by User.
                        else {
                            transactionList = transactionController.GetUserTransaction(response.Payload);
                        }

                        TransactionGV.DataSource = transactionList;
                        TransactionGV.DataBind();
                    }
                    else {
                        Response.Redirect("~/Views/HomePage.aspx?id=" + id);
                    }
                }
                else {
                    Response.Redirect("~/Views/LoginPage.aspx");
                }
            }
        }

        protected void TransactionGV_SelectedIndexChanged(object sender, EventArgs e) {
            GridViewRow row = TransactionGV.SelectedRow;
            int id = Convert.ToInt32(row.Cells[0].Text);
            Response.Redirect("~/Views/TransactionDetail.aspx?id=" + id);
        }

        protected void BackToHomePage_Click(object sender, EventArgs e) {
            HttpCookie userCookie = Request.Cookies["UserID"];
            if (userCookie != null) {
                Response.Redirect("~/Views/HomePage.aspx?id=" + userCookie.Value);
            }
            else {
                Response.Redirect("~/Views/LoginPage.aspx");
            }
        }
    }
}