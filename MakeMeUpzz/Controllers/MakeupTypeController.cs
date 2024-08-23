using MakeMeUpzz.Handlers;
using MakeMeUpzz.Models;
using MakeMeUpzz.Modules;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MakeMeUpzz.Controllers {
    public class MakeupTypeController {
        public static Response<MakeupType> Insert(int MakeupTypeID, String MakeupTypeName) { 
            return MakeupTypeHandler.Insert(MakeupTypeID, MakeupTypeName);
        }
    }
}