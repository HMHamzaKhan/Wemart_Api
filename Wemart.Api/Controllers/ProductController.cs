using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Wemart.Api.Models;
using Wemart.Entities.Entities;
using Wemart.Helpers.Enums;
using Wemart.Repositories;

namespace Wemart.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private readonly IProductRepository productRepository;
        public ProductController(IProductRepository productRepository) => this.productRepository = productRepository;


        [HttpGet, Route("GetApprovedProducts")]
        public async Task<IActionResult> GetApprovedProducts()
        {
            try
            {
                DataTable dt = await productRepository.GetProductsByUserType(UserTypes.User);
                bool hasResponse = dt.Rows.Count > 0;
                return Ok(new ApiResponseModel<DataTable>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "There Are No Approved Products" : null,
                    Reponse = dt
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpGet, Route("GetAllProducts")]
        public async Task<IActionResult> GetAllProducts()
        {
            try
            {
                DataTable dt = await productRepository.GetProductsByUserType(UserTypes.Admin);
                bool hasResponse = dt.Rows.Count > 0;
                return Ok(new ApiResponseModel<DataTable>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "There Are No Products" : null,
                    Reponse = dt
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpGet, Route("GetProductsByCatID/{ShopCatID}")]
        public async Task<IActionResult> GetProductsByCatID(int ShopCatID)
        {
            try
            {
                DataTable dt = await productRepository.GetProductsByCatID(ShopCatID);
                bool hasResponse = dt.Rows.Count > 0;
                return Ok(new ApiResponseModel<DataTable>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "There Are No Approved Products" : null,
                    Reponse = dt
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpGet, Route("GetProductsByShopID/{ShopID}")]
        public async Task<IActionResult> GetProductsByShopID(int ShopID)
        {
            try
            {
                DataTable dt = await productRepository.GetProductsByUserType(UserTypes.Shop, ShopID);
                bool hasResponse = dt.Rows.Count > 0;
                return Ok(new ApiResponseModel<DataTable>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "There Are No Products" : null,
                    Reponse = dt
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpGet, Route("DeleteProductByID/{ID}")]
        public async Task<IActionResult> DeleteProductByID(int ID)
        {
            try
            {
                bool hasResponse = await productRepository.DeleteProductByID(ID);
                return Ok(new ApiResponseModel<string>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "Something went wrong" : null,
                    Reponse = hasResponse ? "Product is deleted" : null
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpGet, Route("ApproveProductByID/{ID}")]
        public async Task<IActionResult> ApproveProductByID(int ID)
        {
            try
            {
                bool hasResponse = await productRepository.ApproveProductByID(ID);
                return Ok(new ApiResponseModel<string>
                {
                    HasReponse =  hasResponse,
                    Message    = !hasResponse ? "Something went wrong" : null,
                    Reponse    =  hasResponse ? "Product is Approved" : null
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }



        [HttpPost, Route("AddProduct")]
        public async Task<IActionResult> AddProduct(IFormCollection collection)
        {
            ProductEntity entity = new ProductEntity();
            try
            {
                var inputs = collection.Keys.ToArray();

                entity.ShopID = Convert.ToInt32( inputs[0].Split(",")[1] );
                entity.CatID  = Convert.ToInt32( inputs[1].Split(",")[1] );
                entity.Price  = Convert.ToDecimal( inputs[4] );
                entity.Name   = inputs[2];
                entity.Unit   = inputs[3];
                entity.Img    = await FileUploader.AddFile(collection.Files[0], "ProductImages", inputs[2] + DateTime.Now.Ticks);

                bool hasResponse = await productRepository.AddProduct(entity);
                return Ok(new ApiResponseModel<string>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "Something went wrong" : null,
                    Reponse = hasResponse ? "Product is deleted" : null
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }
    }
}