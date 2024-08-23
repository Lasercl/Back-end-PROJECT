using MakeMeUpzz.Controllers;
using MakeMeUpzz.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MakeMeUpzz.Views {
    public partial class HandleTransaction : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                TransactionController transactionController = new TransactionController();
                List<TransactionHeader> unhandledTran = transactionController.GetAllUnhandledTransaction();
                TransactionGV.DataSource = unhandledTran;
                TransactionGV.DataBind();
            }
        }

        protected void TransactionGV_RowUpdating(object sender, GridViewUpdateEventArgs e) {
            GridViewRow row = TransactionGV.Rows[e.RowIndex];
            int id = Convert.ToInt32(row.Cells[0].Text);

            TransactionController transactionController = new TransactionController();
            transactionController.UpdateTransactionStatusById(id);

            List<TransactionHeader> unhandledTran = transactionController.GetAllUnhandledTransaction();
            TransactionGV.DataSource = unhandledTran;
            TransactionGV.DataBind();
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