using MakeMeUpzz.Factories;
using MakeMeUpzz.Models;
using MakeMeUpzz.Modules;
using MakeMeUpzz.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MakeMeUpzz.Handlers {
    public class MakeupBrandHandler {
        public static Response<MakeupBrand> Insert(int MakeupBrandID, String MakeupBrandName, int MakeupBrandRating) {

            if (MakeupBrandName.Length <= 1 || MakeupBrandName.Length >= 99) {
                return new Response<MakeupBrand>() {
                    Success = false,
                    Message = "Makeup brand name must between 1-99 characters!",
                    Payload = null
                };
            }
            else {
                MakeupBrand makeupBrand = MakeupBrandFactory.Create(MakeupBrandID, MakeupBrandName, MakeupBrandRating);

                MakeupBrandRepository.Insert(makeupBrand);

                return new Response<MakeupBrand>() {
                    Success = true,
                    Message = "Register Success!",
                    Payload = makeupBrand
                };
            }
        }
    }
}