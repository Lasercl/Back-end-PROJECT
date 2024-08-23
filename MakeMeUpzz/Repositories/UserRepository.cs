using MakeMeUpzz.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace MakeMeUpzz.Repositories {
    public class UserRepository {
        static MakeMeUpzzDatabaseEntities db = new MakeMeUpzzDatabaseEntities();

        public static List<User> getAllUsers() {
            return db.Users.ToList();
        }
        public static int getNewID() {
            User user = db.Users.ToList().LastOrDefault();
            if (user == null) {
                return 1;
            }
            else {
                return user.UserID + 1;
            }
        }

        public static User getUserByID(int id) {
            return db.Users.Find(id);
        }


        public static User getUserbyUsername(String Username) {
            return (from u in db.Users where u.Username == Username select u).FirstOrDefault();
        }

        public static void Register(User user) {
            db.Users.Add(user);
            db.SaveChanges();
        }

        public static User Login(String Username, String UserPassword) {
            return (from u in db.Users where u.Username == Username && u.UserPassword == UserPassword select u).FirstOrDefault();
        }


        public static bool UpdateUserProfile(User user) {
            try {
                var existingUser = db.Users.Find(user.UserID);
                if (existingUser != null) {
                    existingUser.Username = user.Username;
                    existingUser.UserEmail = user.UserEmail;
                    db.Entry(existingUser).State = EntityState.Modified;
                    db.SaveChanges();
                    return true;
                }
                return false;
            } catch (Exception) {
                return false;
            }
        }

        public static bool UpdateUserPassword(User user) {
            try {
                var existingUser = db.Users.Find(user.UserID);
                if (existingUser != null) {
                    existingUser.UserPassword = user.UserPassword;
                    db.Entry(existingUser).State = EntityState.Modified;
                    db.SaveChanges();
                    return true;
                }
                return false;
            } catch (Exception) {
                return false;
            }
        }

        public static bool IsUsernameUnique(string username) {
            var users = getAllUsers();
            return !users.Any(u => u.Username == username);
        }

    }
}