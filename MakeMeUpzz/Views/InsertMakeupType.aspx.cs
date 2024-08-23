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
    public partial class InsertMakeupType : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void InserMakeupTypeButton_Click(object sender, EventArgs e) {
            int MakeupTypeID = MakeupTypeRepository.getNewID();
            String MakeupTypeName = MakeupTypeNameTb.Text;

            Response<MakeupType> response = MakeupTypeController.Insert(MakeupTypeID, MakeupTypeName);

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