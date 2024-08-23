using MakeMeUpzz.Handlers;
using MakeMeUpzz.Models;
using MakeMeUpzz.Repositories;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;
using MakeMeUpzz.Modules;

namespace MakeMeUpzz.Views {
    public partial class ManageMakeup : System.Web.UI.Page {

        public List<Makeup> makeups = null;
        public List<MakeupType> makeupTypes = null;
        public List<MakeupBrand> makeupBrands = null;

        MakeupRepository makeupRepository = new MakeupRepository();
        MakeupTypeRepository makeupTypeRepository = new MakeupTypeRepository();
        MakeupBrandRepository makeupBrandRepository = new MakeupBrandRepository();

        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                HttpCookie userCookie = Request.Cookies["UserID"];
                int id;

                if (userCookie != null && Int32.TryParse(userCookie.Value, out id)) {
                    Response<User> response = UserHandler.getUserByID(id);

                    if (response.Success && response.Payload.UserRole == "Admin") {
                        ViewState["SortDirection"] = "DESC"; 
                        LoadData();
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

        private void LoadData() {
            makeups = makeupRepository.GetMakeups();
            MakeupGV.DataSource = makeups;
            MakeupGV.DataBind();

            makeupTypes = makeupTypeRepository.GetMakeupTypes();
            MakeupTypeGV.DataSource = makeupTypes;
            MakeupTypeGV.DataBind();

            makeupBrands = makeupBrandRepository.GetMakeupBrands();
            // Sort makeupBrands by MakeupBrandRating in descending order
            makeupBrands = makeupBrands.OrderByDescending(mb => mb.MakeupBrandRating).ToList();
            MakeupBrandGV.DataSource = makeupBrands;
            MakeupBrandGV.DataBind();
        }

        // Delete and Update Makeup
        protected void MakeupGV_RowDeleting(object sender, GridViewDeleteEventArgs e) {
            GridViewRow row = MakeupGV.Rows[e.RowIndex];
            String id = row.Cells[0].Text;
            makeupRepository.removeMakeupByID(Convert.ToInt32(id));
            LoadData();
        }

        protected void MakeupGV_RowEditing(object sender, GridViewEditEventArgs e) {
            GridViewRow row = MakeupGV.Rows[e.NewEditIndex];
            String id = row.Cells[0].Text;
            Response.Redirect("~/Views/UpdateMakeup.aspx?id=" + id);
        }

        // Delete and Update Makeup Type
        protected void MakeupTypeGV_RowDeleting(object sender, GridViewDeleteEventArgs e) {
            GridViewRow row = MakeupTypeGV.Rows[e.RowIndex];
            String id = row.Cells[0].Text;
            makeupTypeRepository.removeMakeupTypeByID(Convert.ToInt32(id));
            LoadData();
        }

        protected void MakeupTypeGV_RowEditing(object sender, GridViewEditEventArgs e) {
            GridViewRow row = MakeupTypeGV.Rows[e.NewEditIndex];
            String id = row.Cells[0].Text;
            Response.Redirect("~/Views/UpdateMakeupType.aspx?id=" + id);
        }

        // Delete and Update Makeup Brand
        protected void MakeupBrandGV_RowDeleting(object sender, GridViewDeleteEventArgs e) {
            GridViewRow row = MakeupBrandGV.Rows[e.RowIndex];
            String id = row.Cells[0].Text;
            makeupBrandRepository.removeMakeupBrandByID(Convert.ToInt32(id));
            LoadData();
        }

        protected void MakeupBrandGV_RowEditing(object sender, GridViewEditEventArgs e) {
            GridViewRow row = MakeupBrandGV.Rows[e.NewEditIndex];
            String id = row.Cells[0].Text;
            Response.Redirect("~/Views/UpdateMakeupBrand.aspx?id=" + id);
        }

        // Handle Sorting 
        protected void MakeupBrandGV_Sorting(object sender, GridViewSortEventArgs e) {
            if (makeupBrands == null) {
                makeupBrands = makeupBrandRepository.GetMakeupBrands();
            }

            var sortDirection = ViewState["SortDirection"] as string == "ASC" ? "DESC" : "ASC";
            ViewState["SortDirection"] = sortDirection;

            if (e.SortExpression == "MakeupBrandRating") {
                if (sortDirection == "ASC") {
                    makeupBrands = makeupBrands.OrderBy(mb => mb.MakeupBrandRating).ToList();
                }
                else {
                    makeupBrands = makeupBrands.OrderByDescending(mb => mb.MakeupBrandRating).ToList();
                }
            }

            MakeupBrandGV.DataSource = makeupBrands;
            MakeupBrandGV.DataBind();
        }

        // Redirect Buttons
        protected void ToInsertMakeupButton_Click(object sender, EventArgs e) {
            Response.Redirect("~/Views/InsertMakeup.aspx");
        }

        protected void ToInsertMakeupTypeButton_Click(object sender, EventArgs e) {
            Response.Redirect("~/Views/InsertMakeupType.aspx");
        }

        protected void ToInsertMakeupBrandButton_Click(object sender, EventArgs e) {
            Response.Redirect("~/Views/InsertMakeupBrand.aspx");
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
