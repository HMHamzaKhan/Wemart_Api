using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Threading.Tasks;

namespace Wemart.Repositories
{
    public interface ICategoryRepository
    {
        Task<DataTable> GetCategories();
        Task<DataTable> GetCategoriesByShopID(int ShopID);

    }
}
