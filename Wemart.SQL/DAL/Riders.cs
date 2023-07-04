using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Wemart.Repositories;
using System.Threading.Tasks;
using Wemart.Entities.Entities;
using System.Data;

namespace Wemart.SQL.DAL
{
    public class Riders : IRiderRepository
    {
        private Connection connection = Connection.Instance;
        private Dictionary<string, object> Params = new Dictionary<string, object>();

        public async Task<string> ApproveRiderByID(int ID)
        {
            string query = "UPDATE Riders set IsApproved = 1 where ID = @ID";
            return await connection.AddOrUpdateTblAsync(new Dictionary<string, object> { {"@ID", ID } }, query) ? "Rider Approved Successfully" : "something went wrong";
        }

        public async Task<DataTable> GetApprovedRiders() => await connection.GetDataAsync("select * from Riders where IsApproved = 1");
        public async Task<DataTable> GetRiders() => await connection.GetDataAsync("select * from Riders");

        public async Task<string> UpdatePass(RiderEntity entity)
        {
            string query = "";
            Params.Clear();
            if (!string.IsNullOrEmpty(entity.Email))
            {
                Params.Add("@Email", entity.Email);
                query = "UPDATE Riders set Password = @Password where Email = @Email";
            }
            else
            {
                Params.Add("@Number", entity.Number);
                query = "UPDATE Riders set Password = @Password where Number = @Number";
            }
            Params.Add("@Password", entity.Password);
            return await connection.AddOrUpdateTblAsync(Params, query) ? "Password Is Updated" : "something went wrong";
        }
    }
}
