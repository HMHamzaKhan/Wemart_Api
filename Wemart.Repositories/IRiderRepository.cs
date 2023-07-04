using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Threading.Tasks;
using Wemart.Entities.Entities;

namespace Wemart.Repositories
{
    public interface IRiderRepository
    {
        Task<string> UpdatePass(RiderEntity entity);
        Task<string> ApproveRiderByID(int ID);

        Task<DataTable> GetApprovedRiders();
        Task<DataTable> GetRiders();
    }
}
