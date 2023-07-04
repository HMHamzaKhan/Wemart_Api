using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Wemart.Api.Models;
using Wemart.Entities.Entities;
using Wemart.Helpers;
using Wemart.Repositories;

namespace Wemart.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RiderController : ControllerBase
    {
        private readonly IRiderRepository riderRepository;
        public RiderController(IRiderRepository riderRepository) => this.riderRepository = riderRepository;

        [HttpGet, Route("GetApprovedRiders")]
        public async Task<IActionResult> GetApprovedRiders()
        {
            try
            {
                DataTable dt = await riderRepository.GetApprovedRiders();
                bool hasResponse = dt.Rows.Count > 0;
                return Ok(new ApiResponseModel<DataTable>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "There Are No Approved Riders" : null,
                    Reponse = dt
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }



        [HttpGet, Route("GetRiders")]
        public async Task<IActionResult> GetRiders()
        {
            try
            {
                DataTable dt = await riderRepository.GetRiders();
                bool hasResponse = dt.Rows.Count > 0;
                return Ok(new ApiResponseModel<DataTable>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "There Are No Approved Riders" : null,
                    Reponse = dt
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpPost, Route("ApproveRiderByID/{ID}")]
        public async Task<IActionResult> ApproveRiderByID(int ID)
        {
            try
            {
                string response = await riderRepository.ApproveRiderByID(ID);
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

        [HttpPost, Route("UpdatePass")]
        public async Task<IActionResult> UpdatePass(RiderEntity entity)
        {
            try
            {
                entity.Password  = WTEncryption.Encrypt(entity.Password);
                string response  = await riderRepository.UpdatePass(entity);
                bool hasResponse = response.Contains("Successfully");
                return Ok(new ApiResponseModel<String>
                {
                    HasReponse = hasResponse,
                    Message    = !hasResponse ? response : null,
                    Reponse    = hasResponse ? response : null
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }
    }
}