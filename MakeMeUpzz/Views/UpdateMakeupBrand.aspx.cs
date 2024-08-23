using MakeMeUpzz.Models;
using MakeMeUpzz.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MakeMeUpzz.Views {
    public partial class UpdateMakeupBrand : System.Web.UI.Page {
        MakeupBrandRepository makeupBrandRepository = new MakeupBrandRepository();

        protected void Page_Load(object sender, EventArgs e) {

            if (IsPostBack == false) {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                MakeupBrand updateMakeupBrand = makeupBrandRepository.GetMakeupBrandByID(id);

                if (updateMakeupBrand != null) {
                    MakeupBrandNameTb.Text = updateMakeupBrand.MakeupBrandName;
                    MakeupBrandRatingTb.Text = updateMakeupBrand.MakeupBrandRating.ToString();
                }
                else {
                    Response.Redirect("~/Views/ManageMakeup.aspx");
                }
            }
        }

        protected void UpdateMakeupBrandButton_Click(object sender, EventArgs e) {
            int updateMakeupBrandID = Convert.ToInt32(Request.QueryString["id"]);
            String updateMakeupBrandName = MakeupBrandNameTb.Text;
            int updateMakeupBrandRating = Convert.ToInt32(MakeupBrandRatingTb.Text);

            makeupBrandRepository.updateMakeupBrandByID(updateMakeupBrandID,
                updateMakeupBrandName, updateMakeupBrandRating);

            Response.Redirect("~/Views/ManageMakeup.aspx");
        }

        protected void ToManageMakeup_Click(object sender, EventArgs e) {
            Response.Redirect("~/Views/ManageMakeup.aspx");
        }
    }
}