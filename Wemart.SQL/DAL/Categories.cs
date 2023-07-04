using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Wemart.Repositories;
using System.Threading.Tasks;
using System.Data;

namespace Wemart.SQL.DAL
{
    public class Categories : ICategoryRepository
    {
        private Connection connection = Connection.Instance;
        private Dictionary<string, object> Params = new Dictionary<string, object>();

        public async Task<DataTable> GetCategories()
        {
            return await connection.GetDataAsync("select cat.*, sp.ID as ShopCatID from Categories cat join ShopCategories sp on cat.ID = sp.CatID");
        }

        public async Task<DataTable> GetCategoriesByShopID(int ShopID)
        {
            return await connection.GetDataAsync("spGetAllCategoriesByShopID", new Dictionary<string, object> { { "@ShopID", ShopID } }, true );
        }
    }
}
