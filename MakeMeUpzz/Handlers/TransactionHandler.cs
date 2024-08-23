using MakeMeUpzz.Models;
using MakeMeUpzz.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MakeMeUpzz.Handlers {
    public class TransactionHandler {
        TransactionRepository transactionRepository = new TransactionRepository();
        
        public List<TransactionHeader> GetAllTransaction() {
            return transactionRepository.GetAllTransaction();
        }
        public List<TransactionHeader> GetUserTransaction(User currUser) {
            return transactionRepository.GetUserTransaction(currUser);
        }

        public TransactionHeader GetTransactionById(int id) {
            return transactionRepository.GetTransactionById(id);
        }

        public List<TransactionHeader> GetAllUnhandledTransaction() {
            return transactionRepository.GetAllUnhandledTransaction();
        }

        public void UpdateTransactionStatusById(int id) {
            transactionRepository.UpdateTransactionStatusById(id);
        }
        public List<TransactionDetail> GetTransactionDetails(int transactionID) {
            return transactionRepository.GetTransactionDetails(transactionID);
        }
        public void Checkout(int userId) {
            transactionRepository.Checkout(userId);
        }
    }
}