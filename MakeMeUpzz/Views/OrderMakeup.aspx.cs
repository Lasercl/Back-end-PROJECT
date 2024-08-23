using MakeMeUpzz.Factories;
using MakeMeUpzz.Handlers;
using MakeMeUpzz.Models;
using MakeMeUpzz.Repositories;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MakeMeUpzz.Views {
    public partial class OrderMakeup : System.Web.UI.Page {
        public List<Makeup> makeups = null;

        CartRepository cartRepository = new CartRepository();
        MakeupRepository makeupRepository = new MakeupRepository();

        public static int userID;
        public Cart cartk = null;

        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                HttpCookie userCookie = Request.Cookies["UserID"];
                int id;
                if (userCookie != null && int.TryParse(userCookie.Value, out id)) {
                    var user = UserHandler.getUserByID(id);
                    if (user != null && user.Payload != null && user.Payload.UserRole == "User") {
                        userID = id;
                        System.Diagnostics.Debug.WriteLine($"UserID retrieved and set: {userID}");
                        LoadMakeupItems();
                        LoadCartItems();
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

        private void LoadMakeupItems() {
            makeups = makeupRepository.GetMakeups();
            OrderMakeupGV.DataSource = makeups;
            OrderMakeupGV.DataBind();
        }

        private void LoadCartItems() {
            var cartItems = cartRepository.GetCartItems(userID);
            System.Diagnostics.Debug.WriteLine("Number of cart items: " + (cartItems?.Count ?? 0));
            if (cartItems != null && cartItems.Any()) {
                System.Diagnostics.Debug.WriteLine("Cart items before processing:");

                var displayCartItems = cartItems
                   .Where(item => item != null && item.Makeup != null)
                   .Select(item => new {
                       MakeupName = item.Makeup.MakeupName,
                       item.Quantity
                   })
                   .ToList();
                System.Diagnostics.Debug.WriteLine("Display cart items before binding:");
                foreach (var item in displayCartItems) {
                    System.Diagnostics.Debug.WriteLine($"MakeupName: {item.MakeupName}, Quantity: {item.Quantity}");
                }
                CartGridView.DataSource = displayCartItems;
                CartGridView.DataBind();
                System.Diagnostics.Debug.WriteLine("Cart items loaded and bound to CartGridView. Number of items bound: " + CartGridView.Rows.Count);
            }
            else {
                CartGridView.DataSource = null;
                CartGridView.DataBind();
                System.Diagnostics.Debug.WriteLine("No cart items found.");
            }
        }

        protected void OrderMakeupGV_RowCommand(object sender, GridViewCommandEventArgs e) {
            if (e.CommandName == "add_to_cart") {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = OrderMakeupGV.Rows[index];
                TextBox quantityTextBox = (TextBox)row.FindControl("QuantityTB");

                if (quantityTextBox != null && int.TryParse(quantityTextBox.Text, out int quantity) && quantity > 0) {
                    int makeupID = Convert.ToInt32(OrderMakeupGV.DataKeys[index]?.Value);
                    if (makeupID > 0) {
                        Debug.WriteLine(userID);
                        cartRepository.AddToCart(userID, makeupID, quantity);
                        ErrorLabel.Text = "Item added to cart.";
                        LoadCartItems();
                    }
                    else {
                        ErrorLabel.Text = "Invalid makeup ID.";
                    }
                }
                else {
                    ErrorLabel.Text = "Please enter a valid quantity.";
                }
            }
        }

        protected void ClearBtn_Click(object sender, EventArgs e) {
            cartRepository.ClearCart(userID);
            LoadCartItems();
        }

        protected void CheckoutBtn_Click(object sender, EventArgs e) {
            TransactionRepository transactionRepository = new TransactionRepository();
            Debug.WriteLine(userID);
            transactionRepository.Checkout(userID);

            cartRepository.ClearCart(userID);
            LoadCartItems();

            ErrorLabel.Text = "Checkout successful!";
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
