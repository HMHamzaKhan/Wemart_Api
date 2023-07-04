using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Wemart.Api.Models;
using Wemart.Entities.Entities;
using Wemart.Repositories;

namespace Wemart.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductReviewController : ControllerBase
    {
        private readonly IProductReviewRepository productReviewRepository;
        public ProductReviewController(IProductReviewRepository productReviewRepository) => this.productReviewRepository = productReviewRepository;


        [HttpGet, Route("GetAllRatings")]
        public async Task<IActionResult> GetAllRatings()
        {
            try
            {
                DataTable dt = await productReviewRepository.GetAllRatings();
                bool hasResponse = dt.Rows.Count > 0;
                return Ok(new ApiResponseModel<DataTable>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "there are no ratings yet" : null,
                    Reponse = dt
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpGet, Route("GetRatingsByProductID/{ID}")]
        public async Task<IActionResult> GetRatingsByProductID(int ID)
        {
            try
            {
                DataTable dt = await productReviewRepository.GetRatingsByProductID(ID);
                bool hasResponse = dt.Rows.Count > 0;
                return Ok(new ApiResponseModel<DataTable>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "no ratings yet on this product" : null,
                    Reponse = dt
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpPost, Route("AddRating")]
        public async Task<IActionResult> AddRating(ProductReviewEntity entity)
        {
            try
            {
                string response = await productReviewRepository.AddUpdateRating(entity);
                bool hasResponse = response.Contains("Successfully");
                return Ok(new ApiResponseModel<String>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? response : null,
                    Reponse = hasResponse ? response : null
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }
    }
}