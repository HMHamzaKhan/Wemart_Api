using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Wemart.Api.Models;
using Wemart.Api.Security;

namespace Wemart.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        // GET: api/Auth
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/Auth/5
        [MyAuthorize("User"), HttpGet, Route("GetByID/{id}")]
        public ApiResponseModel<String> GetByID(int id)
        {
            return new ApiResponseModel<string> { HasReponse = true, Message = null, Reponse = "value" };
        }

        // POST: api/Auth
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT: api/Auth/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
