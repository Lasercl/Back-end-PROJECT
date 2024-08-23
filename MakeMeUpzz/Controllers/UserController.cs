using MakeMeUpzz.Handlers;
using MakeMeUpzz.Models;
using MakeMeUpzz.Modules;
using MakeMeUpzz.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MakeMeUpzz.Controllers {
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

        public static Response<User> Register(int UserID, String Username, String UserEmail,
            DateTime UserDOB, String UserGender, String UserRole, String UserPassword, String UserPassword2) {
            if (Username == "" || UserPassword == "" || UserPassword2 == "") {
                return new Response<Models.User>() {
                    Success = false,
                    Message = "Please fill in all fields!",
                    Payload = null
                };
            }
            else if (UserPassword != UserPassword2) {
                return new Response<Models.User>() {
                    Success = false,
                    Message = "Passwords must match!",
                    Payload = null
                };
            }
            else {
                return UserHandler.Register(UserID, Username, UserEmail, UserDOB,
                    UserGender, UserRole, UserPassword, UserPassword2);

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