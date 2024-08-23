using MakeMeUpzz.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MakeMeUpzz.Repositories {
    public class MakeupTypeRepository {
        static MakeMeUpzzDatabaseEntities db = new MakeMeUpzzDatabaseEntities();

        public List<MakeupType> GetMakeupTypes() {
            // return (from x in db.Foods select x).ToList();
            return db.MakeupTypes.ToList();
        }

        public static int getNewID() {
            MakeupType makeupType = db.MakeupTypes.ToList().LastOrDefault();
            if (makeupType == null) {
                return 1;
            }
            else {
                return makeupType.MakeupTypeID + 1;
            }
        }
        public MakeupType GetMakeupTypeByID(int id) {
            MakeupType makeupType = db.MakeupTypes.Find(id);
            return makeupType;
        }

        public static void Insert(MakeupType makeupType) {
            db.MakeupTypes.Add(makeupType);
            db.SaveChanges();
        }

        public void removeMakeupTypeByID(int id) {
            MakeupType makeupTypes = db.MakeupTypes.Find(id);
            db.MakeupTypes.Remove(makeupTypes);
            db.SaveChanges();
        }


        public void updateMakeupTypeByID(int MakeupTypeID, String MakeupTypeName) {
            MakeupType updateMakeupType = GetMakeupTypeByID(MakeupTypeID);
            updateMakeupType.MakeupTypeName = MakeupTypeName;

            db.SaveChanges();
        }
    }
}