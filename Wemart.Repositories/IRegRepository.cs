using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Threading.Tasks;
using Wemart.Entities.Entities;

namespace Wemart.Repositories
{
    public interface IRegRepository 
    {
        Task<DataTable> Login(UserEntity entity);
        Task<DataTable> Login(ShopEntity entity);
        Task<DataTable> Login(RiderEntity entity);
        Task<DataTable> Login(AdminEntity entity);

        Task<string> Registation(UserEntity entity);
        Task<string> Registation(ShopEntity entity);
        Task<string> Registation(RiderEntity entity);
        Task<string> Registation(AdminEntity entity);
    }
}
