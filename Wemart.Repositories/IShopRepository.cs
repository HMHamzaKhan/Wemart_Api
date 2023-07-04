using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Threading.Tasks;
using Wemart.Entities.Entities;
using Wemart.Helpers.Enums;

namespace Wemart.Repositories
{
    public interface IShopRepository
    {
        Task<string> ApproveShopByID(int ID);
        Task<string> UpdatePass(ShopEntity shopEntity);
        Task<DataTable> GetShops(UserTypes userType, int ID = 0);
    }
}
