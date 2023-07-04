using System;
using System.Collections.Generic;
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
    public class UserController : ControllerBase
    {
        private readonly IUserRepository userRepository;
        public UserController(IUserRepository userRepository) => this.userRepository = userRepository;



        [HttpPost, Route("UpdatePass")]
        public async Task<IActionResult> UpdatePass(UserEntity entity)
        {
            try
            {
                entity.Password = WTEncryption.Encrypt(entity.Password);
                string response = await userRepository.UpdatePass(entity);
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