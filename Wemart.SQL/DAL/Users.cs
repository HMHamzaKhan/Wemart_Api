using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Wemart.Repositories;
using Wemart.Entities.Entities;
using Wemart.Helpers;
using System.Data;

namespace Wemart.SQL.DAL
{
    public class Users : IUserRepository
    {
        private Connection connection = Connection.Instance;
        private Dictionary<string, object> Params = new Dictionary<string, object>();

        public async Task<DataTable> GetUsers() => await connection.GetDataAsync("select * from Users");

        public async Task<string> UpdatePass(UserEntity entity)
        {
            string query = "";
            Params.Clear();
            if (!string.IsNullOrEmpty(entity.Email))
            {
                Params.Add("@Email", entity.Email);
                query = "UPDATE Users set Password = @Password where Email = @Email";
            }
            else
            {
                Params.Add("@Number", entity.Number);
                query = "UPDATE Users set Password = @Password where Number = @Number";
            }
            Params.Add("@Password", entity.Password);
            return await connection.AddOrUpdateTblAsync(Params, query) ? "Shop Approved Successfully" : "something went wrong";
        }
    }
}


