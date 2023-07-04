using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Wemart.Entities.Entities;
using Wemart.Helpers;
using Wemart.Repositories;

namespace Wemart.SQL.DAL
{
    public class Registration : IRegRepository
    {

        private Connection connection = Connection.Instance;
        private Dictionary<string, object> Params = new Dictionary<string, object>();
        private string QueryOrSP = "";

        #region Sign In

        public async Task<DataTable> Login(UserEntity entity)
        {
            Params.Clear();
            Params.Add("@Number", entity.Number);
            Params.Add("@Password", entity.Password);

            return await connection.GetDataAsync("spUserLogin", Params, true);
        }

        public async Task<DataTable> Login(ShopEntity entity)
        {
            Params.Clear();
            Params.Add("@Number", entity.Number);
            Params.Add("@Password", entity.Password);

            return await connection.GetDataAsync("spShopLogin", Params, true);
        }

        public async Task<DataTable> Login(RiderEntity entity)
        {
            Params.Clear();
            Params.Add("@Number", entity.Number);
            Params.Add("@Password", entity.Password );

            return await connection.GetDataAsync("spRiderLogin", Params, true);
        }
        

        public async Task<DataTable> Login(AdminEntity entity)
        {
            Params.Clear();
            Params.Add("@Number", entity.Number);
            Params.Add("@Password", entity.Password);

            return await connection.GetDataAsync("spAdminLogin", Params, true);
        }

        #endregion

        #region Sign Up

        public async Task<string> Registation(UserEntity entity)
        {
            Params.Clear();
            Params.Add("@Number", entity.Number);
            string ResponseMsg = "this user is already registered please try different number";

            if (connection.GetDataAsync("select ID from Users where Number = @Number", Params).Result.Rows.Count > 0) return ResponseMsg;

            Params.Add("@Name", entity.Name);
            Params.Add("@Password", entity.Password);
            Params.Add("@Token", entity.Token);
            Params.Add("@Email", entity.Email);
            Params.Add("@CreatedDate", entity.CreatedDate);
            Params.Add("@CreatedTime", entity.CreatedTime);
            Params.Add("@Img", entity.Img ?? "-");

            ResponseMsg = await connection.AddOrUpdateTblAsync(Params, "spUserRegistration", true) ? "User Registered Successfully" : "something went wrong";

            return ResponseMsg;
        }



        public async Task<string> Registation(ShopEntity entity)
        {
            Params.Clear();
            Params.Add("@Number", entity.Number);
            string ResponseMsg = "this user is already registered please try different number";

            if (connection.GetDataAsync("select ID from Shops where Number = @Number", Params).Result.Rows.Count > 0) return ResponseMsg;

            Params.Add("@Img", entity.Img);
            Params.Add("@Name", entity.Name);
            Params.Add("@Token", entity.Token);
            Params.Add("@Email", entity.Email);
            Params.Add("@Address", entity.Address);
            Params.Add("@Password", entity.Password);
            Params.Add("@Location", entity.Location);
            Params.Add("@Latitude", entity.Latitude );
            Params.Add("@Longitude", entity.Longitude);
            Params.Add("@IsApproved", entity.IsApproved);
            Params.Add("@CreatedDate", entity.CreatedDate);
            Params.Add("@CreatedTime", entity.CreatedTime);

            ResponseMsg = await connection.AddOrUpdateTblAsync(Params, "spShopRegistration", true) ? "Shop added Successfully" : "something went wrong";

            return ResponseMsg;
        }



        public async Task<string> Registation(RiderEntity entity)
        {
            Params.Clear();
            Params.Add("@Number", entity.Number);
            string ResponseMsg = "this user is already registered please try different number";

            if (connection.GetDataAsync("select ID from Riders where Number = @Number", Params).Result.Rows.Count > 0) return ResponseMsg;

            Params.Add("@Name", entity.Name);
            Params.Add("@Password", entity.Password);
            Params.Add("@Token", entity.Token);
            Params.Add("@Img", entity.Img ?? "-");
            Params.Add("@Email", entity.Email);
            Params.Add("@IsApproved",  entity.IsApproved);
            Params.Add("@CreatedDate", entity.CreatedDate);
            Params.Add("@CreatedTime", entity.CreatedTime);

            ResponseMsg = await connection.AddOrUpdateTblAsync(Params, "spRiderRegistration", true) ? "User Registered Successfully" : "something went wrong";

            return ResponseMsg;
        }



        public async Task<string> Registation(AdminEntity entity)
        {
            Params.Clear();
            Params.Add("@Number", entity.Number);
            string ResponseMsg = "this user is already registered please try different number";

            if (connection.GetDataAsync("select ID from Admins where Number = @Number", Params).Result.Rows.Count > 0) return ResponseMsg;
            
            Params.Add("@Name", entity.Name);
            Params.Add("@Token", entity.Token);
            Params.Add("@Email", entity.Email);
            Params.Add("@Password", entity.Password);

            ResponseMsg = await connection.AddOrUpdateTblAsync(Params, "spAdminRegistration", true) ? "Admin Registered Successfully" : "something went wrong";

            return ResponseMsg;
        }

        #endregion

    }
}
