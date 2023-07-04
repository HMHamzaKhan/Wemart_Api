using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Threading.Tasks;
using Wemart.Entities.Entities;
using Wemart.Helpers.Enums;

namespace Wemart.Repositories
{
    public interface IProductRepository
    {
        Task<bool> DeleteProductByID(int ID);
        Task<bool> ApproveProductByID(int ID);
        Task<bool> AddProduct(ProductEntity productEntity);

        Task<DataTable> GetProductsByCatID(int ShopCatID);
        Task<DataTable> GetProductsByUserType(UserTypes userType, int ID = 0);
    }
}
