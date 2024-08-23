using MakeMeUpzz.Factories;
using MakeMeUpzz.Models;
using MakeMeUpzz.Modules;
using MakeMeUpzz.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MakeMeUpzz.Handlers {
    public class MakeupHandler {
        public static Response<Makeup> Insert(int MakeupID, String MakeupName, int MakeupPrice, int MakeupWeight,
            int MakeupTypeID, int MakeupBrandID) {

            if (MakeupName == null) {
                return new Response<Makeup>() {
                    Success = false,
                    Message = "Makeup name cannot be empty!",
                    Payload = null
                };
            }
            else if(MakeupName.Length <= 1 || MakeupName.Length >= 99 ) {
                return new Response<Makeup>() {
                    Success = false,
                    Message = "Makeup name must between 1-99 characters!",
                    Payload = null
                };
            }
            else if(MakeupPrice <=0) {
                return new Response<Makeup>() {
                    Success = false,
                    Message = "Makeup price must greater than 1!",
                    Payload = null
                };
            }
            else if(MakeupWeight <=0) {
                return new Response<Makeup>() {
                    Success = false,
                    Message = "Makeup weight cannot be greater than 1500 since it is in grams!",
                    Payload = null
                };
            }
            else if (MakeupTypeID == null) {
                return new Response<Makeup>() {
                    Success = false,
                    Message = "MakeupTypeID cannot be empty!",
                    Payload = null
                };
            }
            else if (MakeupBrandID == null) {
                return new Response<Makeup>() {
                    Success = false,
                    Message = "MakeuplBrandID cannot be empty!",
                    Payload = null
                };
            }
            else {
                Makeup makeup = MakeupFactory.Create(MakeupID, MakeupName, MakeupPrice,
                    MakeupWeight, MakeupTypeID, MakeupBrandID);

                MakeupRepository.Insert(makeup);

                return new Response<Makeup>() {
                    Success = true,
                    Message = "Register Success!",
                    Payload = makeup
                };
            }
        }

    }
}