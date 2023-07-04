using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Threading.Tasks;
using Wemart.Entities.Entities;

namespace Wemart.Repositories
{
    public interface IProductReviewRepository
    {
        Task<string> AddUpdateRating(ProductReviewEntity entity);
        Task<DataTable> GetAllRatings();
        Task<DataTable> GetRatingsByProductID(int ID);
    }
}
