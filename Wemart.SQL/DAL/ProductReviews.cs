using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Wemart.Entities.Entities;
using Wemart.Repositories;

namespace Wemart.SQL.DAL
{
    public class ProductReviews : IProductReviewRepository
    {
        private Connection connection = Connection.Instance;
        private Dictionary<string, object> Params = new Dictionary<string, object>();

        public async Task<string> AddUpdateRating(ProductReviewEntity entity)
        {
            Params.Clear();
            Params.Add("@UserID", entity.UserID);
            Params.Add("@ProductID", entity.ProductID);
            Params.Add("@ReviewOn", entity.ReviewOn);
            Params.Add("@Rating", entity.Rating);
            Params.Add("@Comments", entity.Comments);

            return await connection.AddOrUpdateTblAsync(Params, "spAddUpdateRating", true) ? "Review Added Succussfully" : "Something Went Wrong";
        }

        public async Task<DataTable> GetAllRatings() 
            => await connection.GetDataAsync("select * from ProductReviews");

        public async Task<DataTable> GetRatingsByProductID(int ID) 
            => await connection.GetDataAsync("select *, (select [Name] from Users where ID = pr.UserID ) as UserName from ProductReviews pr where ProductID = @ID", new Dictionary<string, object> { {"@ID", ID } });
       

    }
}

