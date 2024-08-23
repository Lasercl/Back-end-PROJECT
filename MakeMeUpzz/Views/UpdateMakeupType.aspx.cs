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
    public partial class UpdateMakeupType : System.Web.UI.Page {
        MakeupTypeRepository makeupTypeRepository = new MakeupTypeRepository();
        protected void Page_Load(object sender, EventArgs e) {

            if(IsPostBack == false) {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                MakeupType updateMakeupType = makeupTypeRepository.GetMakeupTypeByID(id);

                if(updateMakeupType != null) {
                    MakeupTypeNameTb.Text = updateMakeupType.MakeupTypeName;
                }
                else {
                    Response.Redirect("~/Views/ManageMakeup.aspx");
                }
            }
        }

        protected void UpdateMakeupTypeButton_Click(object sender, EventArgs e) {
            int updateMakeupTypeID = Convert.ToInt32(Request.QueryString["id"]);
            String updateMakeupTypeName = MakeupTypeNameTb.Text;

            makeupTypeRepository.updateMakeupTypeByID(updateMakeupTypeID, 
                updateMakeupTypeName);

            Response.Redirect("~/Views/ManageMakeup.aspx");
        }

        protected void ToManageMakeup_Click(object sender, EventArgs e) {
            Response.Redirect("~/Views/ManageMakeup.aspx");
        }
    }
}