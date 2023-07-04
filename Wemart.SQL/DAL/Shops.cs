using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Wemart.Entities.Entities;
using Wemart.Helpers;
using Wemart.Helpers.Enums;
using Wemart.Repositories;

namespace Wemart.SQL.DAL
{
    public class Shops : IShopRepository
    {
        private Connection connection = Connection.Instance;
        private Dictionary<string, object> Params = new Dictionary<string, object>();
        private string QueryOrSP = "";
       
        public async Task<DataTable> GetShops(UserTypes userType, int ID = 0)
        {
            DataTable dt;
            Params.Clear();
            switch (userType)
            {
                case UserTypes.Admin:
                    dt = await connection.GetDataAsync("select * from Shops");
                    break;
                case UserTypes.Shop:
                    dt = await connection.GetDataAsync("select * from Shops where ID = @ID", new Dictionary<string, object> { { "@ID", ID } });
                    break;
                case UserTypes.User:
                    dt = await connection.GetDataAsync("spGetApprovedShops", null, true);
                    break;
                case UserTypes.Rider:
                    dt = await connection.GetDataAsync("spGetApprovedShops", null, true);
                    break;
                default:
                    dt = await connection.GetDataAsync("spGetApprovedShops", null, true);
                    break;
            }

            return dt;

        }

        public async Task<string> ApproveShopByID(int ID)
        {
            Params.Clear();
            Params.Add("@ID", ID);
            return await connection.AddOrUpdateTblAsync(Params, "spApproveShopByID", true) ? "Shop Approved Successfully" : "Successfully";
        }

        public  async Task<string> UpdatePass(ShopEntity entity)
        {
            string query = "";
            Params.Clear();
            if (!string.IsNullOrEmpty(entity.Email))
            {
                Params.Add("@Email", entity.Email);
                query = "UPDATE Shops set Password = @Password where Email = @Email";
            }
            else
            {
                Params.Add("@Number", entity.Number);
                query = "UPDATE Shops set Password = @Password where Number = @Number";
            }
            Params.Add("@Password", entity.Password);
            return await connection.AddOrUpdateTblAsync(Params, query) ? "Shop Approved Successfully" : "something went wrong";
        }
    }
}
