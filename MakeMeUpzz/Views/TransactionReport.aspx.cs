using MakeMeUpzz.Controllers;
using MakeMeUpzz.Dataset;
using MakeMeUpzz.Handlers;
using MakeMeUpzz.Models;
using MakeMeUpzz.Report;
using MakeMeUpzz.Repositories;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MakeMeUpzz.Views
{
    public partial class TransactionReport : System.Web.UI.Page
    {
        TransactionController controllers=new TransactionController();
        protected void Page_Load(object sender, EventArgs e)
        {
            CrystalReport1 report=new CrystalReport1();
            CrystalReportViewer1.ReportSource=report;
            DataSet1 data = getData(controllers.GetAllTransaction());
            report.SetDataSource(data);
        }
        private DataSet1 getData(List<TransactionHeader> transactionheader)
        {
            DataSet1 data = new DataSet1();
            var headertable = data.transaction_headers;
            var detailtable = data.transaction_details;
            foreach(TransactionHeader t in transactionheader)
            {
                var grandtotal = t.TransactionDetails.Sum(d => d.Quantity * d.Makeup.MakeupPrice);
                var hrow = headertable.NewRow();
                hrow["id"] = t.TransactionID;
                hrow["user_id"] = t.UserID;
                hrow["user_name"] = t.User.Username;
                hrow["transaction_date"] = t.TransactionDate;
                hrow["status"] = t.Status;
                hrow["grand_total"] = grandtotal;
                headertable.Rows.Add(hrow);
                foreach(MakeMeUpzz.Models.TransactionDetail d in t.TransactionDetails)
                {
                    var subtotal=d.Quantity* d.Makeup.MakeupPrice;
                    var drow=detailtable.NewRow();
                    drow["transaction_id"]=d.TransactionID;
                    drow["makeup_id"] = d.MakeupID;
                    drow["makeup_name"] = d.Makeup.MakeupName;
                    drow["quantity"]=d.Quantity;
                    drow["makeup_price"] = d.Makeup.MakeupPrice;
                    drow["subtotal"] = subtotal;
                    detailtable.Rows.Add(drow);
                }
            }
            return data;
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