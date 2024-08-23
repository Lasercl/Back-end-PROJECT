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
    public partial class InsertMakeupBrand : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void InserMakeupBrandButton_Click(object sender, EventArgs e) {
            int MakeupBrandID = MakeupBrandRepository.getNewID();
            String MakeupBrandName = MakeupBrandNameTb.Text;
            int MakeupBrandRating = Convert.ToInt32(MakeupBrandRatingTb.Text);

            Response<MakeupBrand> response = MakeupBrandController.Insert(MakeupBrandID, MakeupBrandName, MakeupBrandRating);

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