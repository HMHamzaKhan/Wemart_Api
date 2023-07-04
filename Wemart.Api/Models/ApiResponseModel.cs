

namespace Wemart.Api.Models
{
    public class ApiResponseModel<T> where T : class 
    {
        public bool HasReponse { get; set; } 
        public string Message { get; set; } = "Something went wrong";
        public T Reponse { get; set; } 
    }
}
