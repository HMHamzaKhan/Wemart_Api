using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using Wemart.Api.Models;
using Microsoft.AspNetCore.Routing;
using System.Text;

namespace Wemart.Api.Security
{
   // [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = true, Inherited = true)]
    public class MyAuthorizeAttribute : AuthorizeAttribute, IAuthorizationFilter
    {
        public MyAuthorizeAttribute() { }

        public MyAuthorizeAttribute(string policy) : base (policy) { }

        public void OnAuthorization(AuthorizationFilterContext filterContext)
        {            
            if (filterContext == null) return;

            Microsoft.Extensions.Primitives.StringValues authTokens;
            filterContext.HttpContext.Request.Headers.TryGetValue("authToken", out authTokens);

            var _token = authTokens.FirstOrDefault();

            if (_token != null)
            {
                string authToken = _token;
                if (authToken != null)
                {
                    if (IsValidToken(authToken))
                    {
                        filterContext.HttpContext.Response.Headers.Add("authToken", authToken);
                        filterContext.HttpContext.Response.Headers.Add("AuthStatus", "Authorized");
                        filterContext.HttpContext.Response.Headers.Add("storeAccessiblity", "Authorized");
                    }
                    else
                    {
                        filterContext.HttpContext.Response.Headers.Add("authToken", authToken);
                        filterContext.HttpContext.Response.Headers.Add("AuthStatus", "NotAuthorized");
                        filterContext.HttpContext.Response.StatusCode = (int) HttpStatusCode.Unauthorized;
                        filterContext.HttpContext.Response.HttpContext.Features.Get<IHttpResponseFeature>().ReasonPhrase = "Not Authorized";
                        filterContext.Result = new JsonResult("") { Value = new ApiResponseModel<String> { Message = "UnAuthorized User For this Request" } };
                    }
                }
            }
            else
            {
                filterContext.HttpContext.Response.StatusCode = (int) HttpStatusCode.ExpectationFailed;
                filterContext.HttpContext.Response.HttpContext.Features.Get<IHttpResponseFeature>().ReasonPhrase = "Please Provide authToken";
                filterContext.Result = new JsonResult("") { Value = new ApiResponseModel<String> { Message = "Please Provide authToken in Header" } };
            }
        }

        private bool IsValidToken(string authToken)
        {
            string userRole = Encoding.ASCII.GetString(Convert.FromBase64String(authToken)).Split(new[] { ':' })[0].Trim();
            return userRole.Contains(Policy.Trim());
        }
    }
}
