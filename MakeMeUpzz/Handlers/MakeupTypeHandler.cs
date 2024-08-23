using MakeMeUpzz.Factories;
using MakeMeUpzz.Models;
using MakeMeUpzz.Modules;
using MakeMeUpzz.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MakeMeUpzz.Handlers {
    public class MakeupTypeHandler {
        public static Response<MakeupType> Insert(int MakeupTypeID, String MakeupTypeName) {

            if (MakeupTypeName.Length <= 1 || MakeupTypeName.Length >= 99) {
                return new Response<MakeupType>() {
                    Success = false,
                    Message = "Makeup type name must between 1-99 characters!",
                    Payload = null
                };
            }
            else {
                MakeupType makeupType = MakeupTypeFactory.Create(MakeupTypeID, MakeupTypeName);

                MakeupTypeRepository.Insert(makeupType);

                return new Response<MakeupType>() {
                    Success = true,
                    Message = "Register Success!",
                    Payload = makeupType
                };
            }
        }

    }
}