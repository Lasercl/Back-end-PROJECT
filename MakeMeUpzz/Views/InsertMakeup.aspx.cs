using MakeMeUpzz.Controllers;
using MakeMeUpzz.Models;
using MakeMeUpzz.Modules;
using MakeMeUpzz.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MakeMeUpzz.Views {
    public partial class InsertMakeup : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void InsertMakeupButton_Click(object sender, EventArgs e) {
            int MakeupID = MakeupRepository.getNewID();
            String MakeupName = MakeupNameTb.Text;
            int MakeupPrice = Convert.ToInt32(MakeupPriceTb.Text);
            int MakeupWeight = Convert.ToInt32(MakeupWeightTb.Text);
            int MakeupTypeID = Convert.ToInt32(MakeupTypeIDTb.Text);
            int MakeupBrandID = Convert.ToInt32(MakeupBrandIDTb.Text);

            Response<Makeup> response = MakeupController.Insert(MakeupID, MakeupName, MakeupPrice, 
                MakeupWeight, MakeupTypeID, MakeupBrandID);

            if (response.Success) {
                Response.Redirect("~/Views/ManageMakeup.aspx");
            }
            else {
                ErrorLabel.Text = response.Message;
            }
        }

        protected void ToManageMakeup_Click(object sender, EventArgs e) {
            Response.Redirect("~/Views/ManageMakeup.aspx");
        }
    }
}