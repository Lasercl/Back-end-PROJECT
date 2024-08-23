using MakeMeUpzz.Factories;
using MakeMeUpzz.Models;
using MakeMeUpzz.Modules;
using MakeMeUpzz.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MakeMeUpzz.Handlers {
    public class UserHandler {

        public static Response<String> updateUserProfile(User user) {
            try {
                if (string.IsNullOrEmpty(user.Username) || user.Username.Length < 5 
                    || user.Username.Length > 15) {
                    return new Response<string> {
                        Success = false,
                        Message = "Username must be between 5 and 15 characters long and cannot be empty."
                    };
                }

                bool isUsernameUnique = UserRepository.IsUsernameUnique(user.Username);
                if (!isUsernameUnique) {
                    return new Response<string> {
                        Success = false,
                        Message = "Username is already in use. Please choose a different username."
                    };
                }

                if (string.IsNullOrEmpty(user.UserEmail) || !user.UserEmail.EndsWith(".com", StringComparison.OrdinalIgnoreCase)) {
                    return new Response<string> {
                        Success = false,
                        Message = "Email must not be empty and must end with '.com'."
                    };
                }

                if (string.IsNullOrEmpty(user.UserGender)) {
                    return new Response<string> {
                        Success = false,
                        Message = "Gender must be chosen and cannot be empty."
                    };
                }

                if (user.UserDOB == DateTime.MinValue) {
                    return new Response<string> {
                        Success = false,
                        Message = "Date of birth cannot be empty."
                    };
                }

                bool isUpdated = UserRepository.UpdateUserProfile(user);

                if (isUpdated) {
                    return new Response<string> {
                        Success = true,
                        Message = "Profile updated successfully."
                    };
                }
                else {
                    return new Response<string> {
                        Success = false,
                        Message = "Failed to update profile."
                    };
                }
            } catch (Exception ex) {
                return new Response<string> {
                    Success = false,
                    Message = $"An error occurred: {ex.Message}"
                };
            }
        }

        public static Response<string> updateUserPassword(User user) {
            try {
                bool isUpdated = UserRepository.UpdateUserPassword(user);

                if (isUpdated) {
                    return new Response<string> {
                        Success = true,
                        Message = "Password updated successfully."
                    };
                }
                else {
                    return new Response<string> {
                        Success = false,
                        Message = "Failed to update password."
                    };
                }
            } catch (Exception ex) {
                return new Response<string> {
                    Success = false,
                    Message = $"An error occurred: {ex.Message}"
                };
            }
        }

        public static Response<List<User>> getAllUsers(User user) {
            if (user.UserRole == "Admin") {
                return new Response<List<User>>() {
                    Success = true,
                    Message = "Authorized!",
                    Payload = UserRepository.getAllUsers()
                };
            }
            else {
                return new Response<List<User>>() {
                    Success = false,
                    Message = "You are unauthorized to view the user list!",
                    Payload = null
                };
            }
        }

        public static Response<User> getUserByID(int UserID) {
            User user = UserRepository.getUserByID(UserID);
            if (user == null) {
                return new Response<User>() {
                    Success = false,
                    Message = "User not found!",
                    Payload = null
                };
            }
            else {
                return new Response<User>() {
                    Success = true,
                    Message = "User found!",
                    Payload = user
                };
            }
        }

        public static Response<User> Register(int UserID, String Username, String UserEmail, 
            DateTime UserDOB, String UserGender, String UserRole, String UserPassword, String UserPassword2) {
            int emailLength = UserEmail.Length;

            if (UserRepository.getUserbyUsername(Username) != null) {
                return new Response<User>() {
                    Success = false,
                    Message = "Username already taken!",
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
            else if (UserEmail[emailLength - 1] == 'm' && UserEmail[emailLength - 2] == '0'
                && UserEmail[emailLength - 3] == 'c' && UserEmail[emailLength - 4] == 'c')  {

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
                User user = UserFactory.Create(UserID, Username, UserEmail, UserDOB, 
                    UserGender, UserRole, UserPassword);

                UserRepository.Register(user);

                return new Response<User>() {
                    Success = true,
                    Message = "Register Success!",
                    Payload = user
                };
            }
        }

        public static Response<User> Login(String Username, String UserPassword) {
            User user = UserRepository.Login(Username, UserPassword);
            if (user != null) {
                return new Response<User>() {
                    Success = true,
                    Message = "Login Success!",
                    Payload = user
                };
            }
            else {
                return new Response<User>() {
                    Success = false,
                    Message = "Invalid Credentials!",
                    Payload = null
                };
            }
        }
    }
}