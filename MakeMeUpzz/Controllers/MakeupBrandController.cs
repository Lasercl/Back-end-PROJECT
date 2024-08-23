using MakeMeUpzz.Handlers;
using MakeMeUpzz.Models;
using MakeMeUpzz.Modules;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MakeMeUpzz.Controllers {
    public class MakeupBrandController {
        public static Response<MakeupBrand> Insert(int MakeupBrandID, String MakeupBrandName, int MakeupBrandRating) {
            return MakeupBrandHandler.Insert(MakeupBrandID, MakeupBrandName, MakeupBrandRating);
        }
    }
}