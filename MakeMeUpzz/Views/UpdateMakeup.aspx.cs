using MakeMeUpzz.Models;
using MakeMeUpzz.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MakeMeUpzz.Views {
    public partial class UpdateMakeup : System.Web.UI.Page {
        MakeupRepository makeupRepository = new MakeupRepository();
        MakeupTypeRepository makeupTypeRepository = new MakeupTypeRepository();
        MakeupBrandRepository makeupBrandRepository = new MakeupBrandRepository();

        protected void Page_Load(object sender, EventArgs e) {
            if (IsPostBack == false) {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                Makeup updateMakeup = makeupRepository.GetMakeupByID(id);

                if (updateMakeup != null) {
                    MakeupNameTb.Text = updateMakeup.MakeupName;
                    MakeupPriceTb.Text = updateMakeup.MakeupPrice.ToString();
                    MakeupWeightTb.Text = updateMakeup.MakeupWeight.ToString();
                    MakeupTypeIDTb.Text = updateMakeup.MakeupTypeID.ToString();
                    MakeupBrandIDTb.Text = updateMakeup.MakeupBrandID.ToString();
                }
                else {
                    Response.Redirect("~/Views/ManageMakeup.aspx");
                }
            }
        }

        protected void UpdateMakeupButton_Click(object sender, EventArgs e) {
            int updateMakeupID = Convert.ToInt32(Request.QueryString["id"]);
            String updateMakeupName = MakeupNameTb.Text;
            int updateMakeupPrice = Convert.ToInt32(MakeupPriceTb.Text);
            int updateMakeupWeight = Convert.ToInt32(MakeupWeightTb.Text);
            int updateMakeupTypeID = Convert.ToInt32(MakeupTypeIDTb.Text);
            int updateMakeupBrandID = Convert.ToInt32(MakeupBrandIDTb.Text);

            makeupRepository.updateMakeupByID(updateMakeupBrandID, updateMakeupName,
                updateMakeupPrice, updateMakeupWeight, updateMakeupTypeID, updateMakeupBrandID);

            Response.Redirect("~/Views/ManageMakeup.aspx");
        }
    }
}