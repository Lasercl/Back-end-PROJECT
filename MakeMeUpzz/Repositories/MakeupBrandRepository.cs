using MakeMeUpzz.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MakeMeUpzz.Repositories {
    public class MakeupBrandRepository {
        static MakeMeUpzzDatabaseEntities db = new MakeMeUpzzDatabaseEntities();

        public List<MakeupBrand> GetMakeupBrands() {
            // return (from x in db.Foods select x).ToList();
            return db.MakeupBrands.ToList();
        }

        public static int getNewID() {
            MakeupBrand makeupBrand = db.MakeupBrands.ToList().LastOrDefault();
            if (makeupBrand == null) {
                return 1;
            }
            else {
                return makeupBrand.MakeupBrandID + 1;
            }
        }

        public MakeupBrand GetMakeupBrandByID(int id) {
            MakeupBrand makeupBrand = db.MakeupBrands.Find(id);
            return makeupBrand;
        }

        public static void Insert(MakeupBrand makeupBrand) {
            db.MakeupBrands.Add(makeupBrand);
            db.SaveChanges();
        }

        public void removeMakeupBrandByID(int Id) {
            MakeupBrand makeupBrands = db.MakeupBrands.Find(Id);
            db.MakeupBrands.Remove(makeupBrands);
            db.SaveChanges();
        }

        public void updateMakeupBrandByID(int MakeupBrandID, String MakeupBrandName,
            int MakeupBrandRating) {
            MakeupBrand updateMakeupBrand = GetMakeupBrandByID(MakeupBrandID);
            updateMakeupBrand.MakeupBrandName = MakeupBrandName;
            updateMakeupBrand.MakeupBrandRating = MakeupBrandRating;

            db.SaveChanges();
        }
    }
}