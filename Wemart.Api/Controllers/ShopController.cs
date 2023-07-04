using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Wemart.Api.Models;
using Wemart.Api.Security;
using Wemart.Entities.Entities;
using Wemart.Helpers;
using Wemart.Helpers.Enums;
using Wemart.Repositories;
using Wemart.SQL.DAL;

namespace Wemart.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ShopController : ControllerBase
    {
        private readonly IShopRepository shopRepository;

        public ShopController(IShopRepository shopRepository)
        {
            this.shopRepository = shopRepository;
        }

        //[MyAuthorize("User")]
        [HttpGet, Route("GetApprovedShop")]
        public async Task<IActionResult> GetApprovedShop()
        {
            try
            {
                DataTable dt = await shopRepository.GetShops(UserTypes.User);
                bool hasResponse = dt.Rows.Count > 0;
                return Ok(new ApiResponseModel<DataTable>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "there are no approved shops yet" : null,
                    Reponse = dt 
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        //[MyAuthorize("Admin")]
        [HttpGet, Route("GetAllShop")]
        public async Task<IActionResult> GetAllShop()
        {
            try
            {
                DataTable dt = await shopRepository.GetShops(UserTypes.Admin);
                bool hasResponse = dt.Rows.Count > 0;
                return Ok(new ApiResponseModel<DataTable>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "there are no shops yet" : null,
                    Reponse = dt
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpGet, Route("GetShopByID/{ID}")]
        public async Task<IActionResult> GetShopByID(int ID)
        {
            try
            {
                DataTable dt = await shopRepository.GetShops(UserTypes.Shop, ID);
                bool hasResponse = dt.Rows.Count > 0;
                return Ok(new ApiResponseModel<DataTable>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "there are no shops yet" : null,
                    Reponse = dt
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpGet, Route("ApproveShopByID/{ID}")]
        public async Task<IActionResult> ApproveShopByID(int ID)
        {
            try
            {

                string response = await shopRepository.ApproveShopByID(ID);
                bool hasResponse = response.Contains("Successfully");
                return Ok(new ApiResponseModel<String>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? response : null,
                    Reponse =  hasResponse ? response : null
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpPost, Route("UpdatePass")]
        public async Task<IActionResult> UpdatePass(ShopEntity entity)
        {
            try
            {
                entity.Password = WTEncryption.Encrypt(entity.Password);
                string response  = await shopRepository.UpdatePass(entity);
                bool hasResponse = response.Contains("Successfully");
                return Ok(new ApiResponseModel<String>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? response  : null,
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