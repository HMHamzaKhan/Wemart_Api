using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Wemart.Api.Models;
using Wemart.Repositories;

namespace Wemart.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        private readonly ICategoryRepository categoryRepository;
        public CategoryController(ICategoryRepository categoryRepository) => this.categoryRepository = categoryRepository;

        [HttpGet, Route("GetAllCategories")]
        public async Task<IActionResult> GetAllCategories()
        {
            try
            {
                DataTable dt = await categoryRepository.GetCategories();
                bool hasResponse = dt.Rows.Count > 0;
                return Ok(new ApiResponseModel<DataTable>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "There Are No Categories" : null,
                    Reponse = dt
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }


        [HttpGet, Route("GetCategoriesByShopID/{ShopID}")]
        public async Task<IActionResult> GetCategoriesByShopID(int ShopID)
        {
            try
            {
                DataTable dt = await categoryRepository.GetCategoriesByShopID(ShopID);
                bool hasResponse = dt.Rows.Count > 0;
                return Ok(new ApiResponseModel<DataTable>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "There Are No approved Categories in this shop yet" : null,
                    Reponse = dt
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }
    }
}