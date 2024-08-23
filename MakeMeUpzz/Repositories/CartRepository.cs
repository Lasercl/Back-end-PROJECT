using MakeMeUpzz.Factories;
using MakeMeUpzz.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Drawing.Printing;
using System.Linq;
using System.Web.UI.WebControls;

namespace MakeMeUpzz.Repositories {
    public class CartRepository {
        static MakeMeUpzzDatabaseEntities db = new MakeMeUpzzDatabaseEntities();

        public int GetNewID() {
            Cart cart = db.Carts.OrderByDescending(t => t.CartID).FirstOrDefault();
            return cart == null ? 1 : cart.CartID + 1;
        }

        public List<Cart> GetCartItems(int userID) {
            //using (var context = new MakeMeUpzzDatabaseEntities() )
            //{
                // Pastikan untuk menyertakan entitas Makeup
                var cartItems = db.Carts
                                       .Include(c => c.Makeup) // Pastikan properti Makeup dimuat
                                       .Where(c => c.UserID == userID)
                                       .ToList();
                return cartItems;
            
            //return db.Carts.Where(c => c.UserID == userID).ToList();
        }

        public void AddToCart(int userID, int makeupID, int quantity) {
            var existingCart = db.Carts.FirstOrDefault(c => c.UserID == userID && c.MakeupID == makeupID);
            if (existingCart != null) {
                existingCart.Quantity += quantity;
            }
            else {
                Cart newCart = CartFactory.Create(GetNewID(), userID, makeupID, quantity);
                db.Carts.Add(newCart);

            }
            db.SaveChanges();

        }

        public void ClearCart(int userID) {
            var userCartItems = db.Carts.Where(c => c.UserID == userID).ToList();
            if (userCartItems != null && userCartItems.Any()) {
                db.Carts.RemoveRange(userCartItems);
                db.SaveChanges();
            }
        }
    }
}
