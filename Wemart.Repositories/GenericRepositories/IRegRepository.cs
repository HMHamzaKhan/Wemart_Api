using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Wemart.Repositories.GenericRepositories
{
    public interface IRegRepository<T> where T: class 
    {
        DataTable Login(T entity);
        String Register(T entity);
    }
}
