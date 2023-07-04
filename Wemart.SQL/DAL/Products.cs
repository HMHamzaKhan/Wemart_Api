using System;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;
using Wemart.Entities.Entities;
using Wemart.Helpers.Enums;
using Wemart.Repositories;

namespace Wemart.SQL.DAL
{
    public class Products : IProductRepository
    {
        private Connection connection = Connection.Instance;
        private Dictionary<string, object> Params = new Dictionary<string, object>();



        public async Task<bool> AddProduct(ProductEntity productEntity)
        {
            Params.Clear();

            Params.Add("@Img", productEntity.Img);
            Params.Add("@Name", productEntity.Name);
            Params.Add("@Unit", productEntity.Unit ?? "-");
            Params.Add("@Price", productEntity.Price);
            Params.Add("@CatID", productEntity.CatID);
            Params.Add("@ShopID", productEntity.ShopID);
            Params.Add("@IsApproved", productEntity.IsApproved);
            Params.Add("@CreatedDate", productEntity.CreatedDate);
            Params.Add("@CreatedTime", productEntity.CreatedTime);
            
            return await connection.AddOrUpdateTblAsync(Params, "spAddProduct", true);
        }

        public async Task<bool> ApproveProductByID(int ID)
        {
            Params.Clear();
            Params.Add("@ID", ID);
            return await connection.AddOrUpdateTblAsync(Params, "Update Products set IsApproved = 1 where ID = @ID");
        }

        public async Task<bool> DeleteProductByID(int ID) =>
            await connection.AddOrUpdateTblAsync(new Dictionary<string, object> { { "@ID", ID } }, "DELETE FROM Products WHERE ID = @ID");

        public async Task<DataTable> GetProductsByUserType(UserTypes userType, int ID = 0)
        {
            DataTable dt = null;
            switch (userType)
            {
                case UserTypes.Admin:
                    dt = await connection.GetDataAsync("Select * from Products");
                    break;

                case UserTypes.Shop:
                    dt = await connection.GetDataAsync("spGetProductsByShopID", new Dictionary<string, object> { { "@ID", ID } }, true);
                    break;

                case UserTypes.User:
                case UserTypes.Rider:
                    dt = await connection.GetDataAsync("Select * from Products where IsApproved = 1");
                    break;
            }
            return dt;
        }
        
        public async Task<DataTable> GetProductsByCatID(int ShopCatID) =>
            await connection.GetDataAsync("spGetAllProductsByShopCatID", new Dictionary<string, object> { { "@ShopCatID", ShopCatID } }, true);
        
    }
}

