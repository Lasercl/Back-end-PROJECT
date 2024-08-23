using MakeMeUpzz.Controllers;
using MakeMeUpzz.Factories;
using MakeMeUpzz.Handlers;
using MakeMeUpzz.Models;
using MakeMeUpzz.Modules;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MakeMeUpzz.Views {
    public partial class TransactionDetail : System.Web.UI.Page {
        TransactionController transactionController = new TransactionController();
        public static int userID;

        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                HttpCookie userCookie = Request.Cookies["UserID"];
                int id;
                if (userCookie != null && int.TryParse(userCookie.Value, out id)) {
                    Response<User> response = UserHandler.getUserByID(id);
                    if (response.Success) {
                        userID = id;
                        int transactionID = Convert.ToInt32(Request.QueryString["id"]);
                        LoadTransactionDetails(transactionID);
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

        private void LoadTransactionDetails(int transactionID) {
            List<MakeMeUpzz.Models.TransactionDetail> transactionDetails = transactionController.GetTransactionDetails(transactionID);
            
            TransactionDetailGV.DataSource = transactionDetails;
            TransactionDetailGV.DataBind();
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

        protected void BackToTransactionHistory_Click(object sender, EventArgs e) {
            HttpCookie userCookie = Request.Cookies["UserID"];
            if (userCookie != null) {
                Response.Redirect("~/Views/TransactionHistory.aspx?id=" + userCookie.Value);
            }
            else {
                Response.Redirect("~/Views/LoginPage.aspx");
            }
        }

        public string GetSubtotal(object quantity, object price) {
            try
            {
                int qty = Convert.ToInt32(quantity);
                decimal prc = Convert.ToDecimal(price);
                return (qty * prc).ToString("C");
            }
            catch
            {
                return "N/A";
            }
        }
    }
}
