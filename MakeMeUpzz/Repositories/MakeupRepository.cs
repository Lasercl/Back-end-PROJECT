using MakeMeUpzz.Models;
using MakeMeUpzz.Modules;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MakeMeUpzz.Repositories {
    public class MakeupRepository {

        static MakeMeUpzzDatabaseEntities db = new MakeMeUpzzDatabaseEntities();

        public List<Makeup> GetMakeups() {
            // return (from x in db.Foods select x).ToList();
            return db.Makeups.ToList();
        }

        public static int getNewID() {
            Makeup makeup = db.Makeups.ToList().LastOrDefault();
            if (makeup == null) {
                return 1;
            }
            else {
                return makeup.MakeupID + 1;
            }
        }
        public Makeup GetMakeupByID(int id) {
            Makeup makeup = db.Makeups.Find(id);
            return makeup;
        }


        public static void Insert(Makeup makeup) {
            db.Makeups.Add(makeup);
            db.SaveChanges();
        }

        public void removeMakeupByID(int Id) {
            Makeup makeups = db.Makeups.Find(Id);
            db.Makeups.Remove(makeups);
            db.SaveChanges();
        }
        public void updateMakeupByID(int MakeupID, String MakeupName, int MakeupPrice,
            int MakeupWeight, int MakeupTypeID, int MakeupBrandID) {
            Makeup updateMakeup = GetMakeupByID(MakeupID);

            updateMakeup.MakeupName = MakeupName;
            updateMakeup.MakeupPrice = MakeupPrice;
            updateMakeup.MakeupWeight = MakeupWeight;
            updateMakeup.MakeupTypeID = MakeupTypeID;
            updateMakeup.MakeupBrandID = MakeupBrandID;

            db.SaveChanges();
        }

        // For order
        public Response<List<object>> GetMakeupsForOrder() {
            try {
                var makeups = db.Makeups
                    .Select(m => new {
                        MakeupID = m.MakeupID,
                        MakeupName = m.MakeupName,
                        MakeupPrice = m.MakeupPrice,
                        MakeupWeight = m.MakeupWeight,
                        MakeupTypeName = m.MakeupType.MakeupTypeName,
                        MakeupBrandName = m.MakeupBrand.MakeupBrandName
                    })
                    .ToList<object>();

                return new Response<List<object>> {
                    Success = true,
                    Payload = makeups
                };
            } catch (Exception ex) {
                return new Response<List<object>> {
                    Success = false,
                    Message = ex.Message
                };
            }
        }

        public Response<Makeup> GetMakeupByIDForOrder(int id) {
            Makeup makeup = db.Makeups.Find(id);
            if (makeup != null) {
                return new Response<Makeup> {
                    Success = true,
                    Message = "Makeup retrieved successfully.",
                    Payload = makeup
                };
            }
            else {
                return new Response<Makeup> {
                    Success = false,
                    Message = "Makeup not found.",
                    Payload = null
                };
            }
        }

        public Response<string> GetMakeupTypeNameByID(int makeupTypeID) {
            try {
                var makeupType = db.MakeupTypes.Find(makeupTypeID);
                if (makeupType != null) {
                    return new Response<string> {
                        Success = true,
                        Payload = makeupType.MakeupTypeName
                    };
                }
                else {
                    return new Response<string> {
                        Success = false,
                        Message = "Makeup type not found."
                    };
                }
            } catch (Exception ex) {
                return new Response<string> {
                    Success = false,
                    Message = ex.Message
                };
            }
        }

        public Response<string> GetMakeupBrandNameByID(int makeupBrandID) {
            try {
                var makeupBrand = db.MakeupBrands.Find(makeupBrandID);
                if (makeupBrand != null) {
                    return new Response<string> {
                        Success = true,
                        Payload = makeupBrand.MakeupBrandName
                    };
                }
                else {
                    return new Response<string> {
                        Success = false,
                        Message = "Makeup brand not found."
                    };
                }
            } catch (Exception ex) {
                return new Response<string> {
                    Success = false,
                    Message = ex.Message
                };
            }
        }
    }

}
