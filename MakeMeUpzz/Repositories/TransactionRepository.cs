using MakeMeUpzz.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace MakeMeUpzz.Repositories {
    public class TransactionRepository {
        static MakeMeUpzzDatabaseEntities db = new MakeMeUpzzDatabaseEntities();
        public static List<TransactionHeader> GetTransactions()
        {
            return db.TransactionHeaders.ToList();
        }
        public static int GetNewID() {
            TransactionHeader transactionHeader = db.TransactionHeaders.OrderByDescending(t => t.TransactionID).FirstOrDefault();
            return transactionHeader == null ? 1 : transactionHeader.TransactionID + 1;
        }

        public void Checkout(int userId) {
            var cartItems = db.Carts.Where(c => c.UserID == userId).ToList();
            if (cartItems.Any()) {
                var transactionHeader = new TransactionHeader {
                    TransactionID = GetNewID(),
                    UserID = userId,
                    TransactionDate = DateTime.Now,
                    Status = "Unhandled"
                };
                Debug.WriteLine(transactionHeader.TransactionID);
                Debug.WriteLine(transactionHeader.UserID);
                db.TransactionHeaders.Add(transactionHeader);
                db.SaveChanges();

                foreach (var c in cartItems) {
                    var transactionDetail = new TransactionDetail {
                        TransactionID = transactionHeader.TransactionID,
                        MakeupID = c.MakeupID,
                        Quantity = c.Quantity
                    };
                    Debug.WriteLine("DETAILS");
                    Debug.WriteLine(transactionDetail.TransactionID);
                    Debug.WriteLine(transactionDetail.MakeupID);
                    Debug.WriteLine(transactionDetail.Quantity);
                    db.TransactionDetails.Add(transactionDetail);
                }

                db.Carts.RemoveRange(cartItems);
                try {
                    db.SaveChanges();
                } catch (Exception ex) { }
            }
        }

        public List<TransactionHeader> GetAllTransaction() {
            return (from t in db.TransactionHeaders select t).ToList();
        }

        public List<TransactionHeader> GetUserTransaction(User user) {
            return (from t in db.TransactionHeaders where user.UserID == t.UserID select t).ToList();
        }

        public TransactionHeader GetTransactionById(int id) {
            return (from t in db.TransactionHeaders where t.TransactionID == id select t).FirstOrDefault();
        }

        public List<TransactionHeader> GetAllUnhandledTransaction() {
            return (from t in db.TransactionHeaders where t.Status == "Unhandled" select t).ToList();
        }

        public void UpdateTransactionStatusById(int id) {
            TransactionHeader tranHeader = db.TransactionHeaders.Find(id);
            tranHeader.Status = "Handled";
            db.SaveChanges();
        }

        public List<TransactionDetail> GetTransactionDetails(int transactionID) {
            //return (from x in db.TransactionDetails where x.TransactionID == transactionID select x).ToList();
            return db.TransactionDetails
                     .Include(td => td.Makeup)
                     .Include(td => td.Makeup.MakeupType)
                     .Include(td => td.Makeup.MakeupBrand)
                     .Where(td => td.TransactionID == transactionID)
                     .ToList();

        }
    }
}