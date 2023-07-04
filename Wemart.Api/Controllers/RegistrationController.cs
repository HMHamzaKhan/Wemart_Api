using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Wemart.Api.Models;
using Wemart.Entities.Entities;
using Wemart.Helpers;
using Wemart.Helpers.Enums;
using Wemart.Repositories;
using Wemart.SQL;

namespace Wemart.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RegistrationController : ControllerBase
    {
        private readonly IRegRepository RegRepository;
        private readonly IHostingEnvironment _hostingEnvironment;

        public RegistrationController(IRegRepository regRepository, IHostingEnvironment hostingEnvironment)
        {
            RegRepository = regRepository;
           _hostingEnvironment = hostingEnvironment;
        }

        #region User
        [HttpPost]
        [Route("UserLogin")]
        public async Task<IActionResult> UserLogin(UserEntity entity)
        {
            try
            {
                entity.Password = WTEncryption.Encrypt(entity.Password);
                DataTable dt = await RegRepository.Login(entity);
                bool hasResponse = dt.Rows.Count > 0;
                return Ok(new ApiResponseModel<DataTable>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "invalid username or password" : null,
                    Reponse = dt
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpPost]
        [Route("UserRegister")]
        public async Task<IActionResult> UserRegister(UserEntity entity)
        {
            try
            {
                entity.Password = WTEncryption.Encrypt(entity.Password);
                entity.Token = Convert.ToBase64String(Encoding.Default.GetBytes($"User:{ entity.Number + entity.Password }"));

                string response = await RegRepository.Registation(entity);
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
        #endregion

        #region Vendor
        [HttpPost]
        [Route("ShopLogin")]
        public async Task<IActionResult> ShopLogin(ShopEntity entity)
        {
            try
            {
                entity.Password = WTEncryption.Encrypt(entity.Password);
                DataTable dt = await RegRepository.Login(entity);
                bool hasResponse = dt.Columns.Count > 1;
                return Ok(new ApiResponseModel<DataTable>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? dt.Rows[0][0].ToString() : null,
                    Reponse = hasResponse ? dt : null
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpPost]
        [Route("ShopRegister")]
        public async Task<IActionResult> ShopRegister(IFormCollection collection)
        {
            ShopEntity entity = new ShopEntity();
            try
            {
                var inputs = collection.Keys.ToArray();

                entity.Name = inputs[0];
                entity.Email = inputs[1];
                entity.Number = inputs[2];
                entity.Password = WTEncryption.Encrypt( inputs[3] );
                entity.Address = inputs[4];
                entity.Location = inputs[4];
                entity.Latitude = Convert.ToDecimal( inputs[5] );
                entity.Longitude = Convert.ToDecimal( inputs[6] );
                entity.Img   = await FileUploader.AddFile(collection.Files[0], "ShopImgs", inputs[2]);
                entity.Token = Convert.ToBase64String(Encoding.Default.GetBytes($"Vendor,Rider,User:{ inputs[2] + inputs[3] }"));

                      
                string response = await RegRepository.Registation(entity);
                bool hasResponse = response.Contains("Successfully");
                //if (hasResponse)
                //{
                //    await Notify.SendAsyncSMSTo(UserTypes.Admin, "You have new Shop to Registered Please Check");
                //    await Notify.SendAsyncEmailTo(UserTypes.Admin, "You have new Shop to Registered Please Check", "Shop Registration");
                //}

                return Ok(new ApiResponseModel<String>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? response : null,
                    Reponse = hasResponse ? response : null
                });
            }
            catch (Exception ex)
            {
                return BadRequest();
            }
        }
        #endregion

        #region Rider
        [HttpPost]
        [Route("RiderLogin")]
        public async Task<IActionResult> RiderLogin(RiderEntity entity)
        {
            try
            {
                entity.Password = WTEncryption.Encrypt(entity.Password);
                DataTable dt = await RegRepository.Login(entity);
                bool hasResponse = dt.Columns.Count > 1;
                return Ok(new ApiResponseModel<DataTable>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? dt.Rows[0][0].ToString() : null,
                    Reponse = hasResponse ? dt : null
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpPost]
        [Route("RiderRegister")]
        public async Task<IActionResult> RiderRegister(IFormCollection collection)
        {
            RiderEntity entity = new RiderEntity();
            try
            {
                var inputs = collection.Keys.ToArray();

                entity.Name = inputs[0];
                entity.Email = inputs[1];
                entity.Number = inputs[2];
                entity.Password = WTEncryption.Encrypt(inputs[3]);
                entity.Img = await FileUploader.AddFile(collection.Files[0], "RiderImages", inputs[2]);
                entity.Token = Convert.ToBase64String(Encoding.Default.GetBytes($"Rider:{ inputs[2] + inputs[3] }"));

                string response = await RegRepository.Registation(entity);
                bool hasResponse = response.Contains("Successfully");
                return Ok(new ApiResponseModel<String>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? response : null,
                    Reponse = hasResponse ? response : null
                });
            }
            catch (Exception ex)
            {
                return BadRequest();
            }
        }
        #endregion

        #region Admin
        [HttpPost]
        [Route("AdminLogin")]
        public async Task<IActionResult> AdminLogin(AdminEntity entity)
        {
            try
            {
                entity.Password = WTEncryption.Encrypt(entity.Password);
                DataTable dt = await RegRepository.Login(entity);
                bool hasResponse = dt.Rows.Count > 0;
                return Ok(new ApiResponseModel<DataTable>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "invalid username or password" : null,
                    Reponse = dt
                });
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpPost]
        [Route("AdminRegister")]
        public async Task<IActionResult> AdminRegister(AdminEntity entity)
        {
            try
            {
                entity.Password = WTEncryption.Encrypt(entity.Password);
                entity.Token = Convert.ToBase64String(Encoding.Default.GetBytes($"Admin,Vendor,Rider,User:{ entity.Number + entity.Password }"));

                string response = await RegRepository.Registation(entity);
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
        #endregion

        
    }
}