using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Wemart.Api.Models;
using Wemart.Helpers;
using Wemart.Helpers.Enums;
using Wemart.SQL;

namespace Wemart.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NotifyController : ControllerBase
    {

        [HttpGet, Route("SendSms/{number}/{msg}")]
        public async Task<IActionResult> SendSms(string number, string msg)
        {
            try
            {
                await SMS.SendSMSAsync(number, msg);
                return Ok();
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpGet, Route("ForgetPassEmail/{email}/{code}")]
        public async Task<IActionResult> ForgetPassEmail(string email, string code)
        {
            //string Email_BBC = "hamza.khan8910@gmail.com;mubbashir126@gmail.com";

            try
            {
                string content = Email.GetEmailTemplateBody(EmailBodyEnum.ForgotPassword);
                content = content.Replace("@Code", code);

                bool hasResponse = await Email.SendEmailAsync(email, "", "Forget Password", content);

                return Ok(new ApiResponseModel<String>
                {
                    HasReponse = hasResponse,
                    Message = !hasResponse ? "Something went wrong" : null,
                    Reponse = hasResponse ? "Email Sent Succussfully" : null
                });
               
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }
    }
}