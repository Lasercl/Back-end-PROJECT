using MakeMeUpzz.Handlers;
using MakeMeUpzz.Models;
using MakeMeUpzz.Modules;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MakeMeUpzz {
    public class UserController {
        public static Response<User> Login(String Username, String UserPassword) {
            if (Username == "" || UserPassword == "") {
                return new Response<User>() {
                    Success = false,
                    Message = "Please fill in all fields!",
                    Payload = null
                };
            }
            else {
                return UserHandler.Login(Username, UserPassword);
            }
        }

        public static Response<User> Register(int UserID, String Username, String UserEmail, DateTime UserDOB,
            String UserGender, String UserRole, String UserPassword, String UserPassword2) {
            if (Username == "" || UserEmail == ""|| UserDOB == DateTime.MinValue || UserGender == "" ||
                UserRole == "" || UserPassword == "" || UserPassword2 == "") {
                return new Response<Models.User>() {
                    Success = false,
                    Message = "Please fill in all fields!",
                    Payload = null
                };
            }
            else if (Username.Length < 5 || Username.Length > 15) {
                return new Response<User>() {
                    Success = false,
                    Message = "Username must between 5 and 15 alphabet!",
                    Payload = null
                };
            }
            else if (UserEmail.EndsWith(".com")) {
                return new Response<User>() {
                    Success = false,
                    Message = "Email must ends with '.com'!",
                    Payload = null
                };
            }
            else if (UserPassword2 != UserPassword) {
                return new Response<User>() {
                    Success = false,
                    Message = "Password confirmation must be the same with password cannot be empty!",
                    Payload = null
                };
            }
            else {
                return UserHandler.Register(UserID, Username, UserEmail, UserDOB, UserGender,
                    UserRole, UserPassword, UserPassword2);
            }
        }

        public static Response<List<User>> getAllUsers(User user) {
            return UserHandler.getAllUsers(user);
        }

        public static Response<User> getUserByID(int id) {
            return UserHandler.getUserByID(id);
        }
    }
}