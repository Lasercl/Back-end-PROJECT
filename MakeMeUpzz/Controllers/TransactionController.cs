using MakeMeUpzz.Handlers;
using MakeMeUpzz.Models;
using MakeMeUpzz.Repositories;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;
using TransactionHandler = MakeMeUpzz.Handlers.TransactionHandler;


namespace MakeMeUpzz.Controllers {
    public class TransactionController {

        TransactionHandler transactionHandler = new TransactionHandler();
        public List<TransactionHeader> GetAllTransaction() {
            return transactionHandler.GetAllTransaction();
        }

        public List<TransactionHeader> GetUserTransaction(User currUser) {
            return transactionHandler.GetUserTransaction(currUser);
        }

        public TransactionHeader GetTransactionById(int id) {
            return transactionHandler.GetTransactionById(id);
        }

        public List<TransactionHeader> GetAllUnhandledTransaction() {
            return transactionHandler.GetAllUnhandledTransaction();
        }

        public void UpdateTransactionStatusById(int id) {
            transactionHandler.UpdateTransactionStatusById(id);
        }

        public List<TransactionDetail> GetTransactionDetails(int transactionID) {
            return transactionHandler.GetTransactionDetails(transactionID);
        }

        public void Checkout(int userId) {
            transactionHandler.Checkout(userId);
        }
    }
}