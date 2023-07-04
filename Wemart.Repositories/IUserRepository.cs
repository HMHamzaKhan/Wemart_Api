using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Wemart.Entities.Entities;

namespace Wemart.Repositories
{
    public interface IUserRepository
    {
        Task<string> UpdatePass(UserEntity entity);
    }
}
