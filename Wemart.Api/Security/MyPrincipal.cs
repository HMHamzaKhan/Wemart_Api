using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Threading.Tasks;

namespace Wemart.Api.Security
{
    public class MyPrincipal : IPrincipal
    {
        //private Account account;
        //private AccountModel accountModel = new AccountModel();


        //public MyPrincipal(string username, string password)
        //{
        //    this.Identity = new GenericIdentity(username + password);
        //    this.account = accountModel.login(username, password);
        //}

        public IIdentity Identity { get; set; }

        //public bool IsInRole(string role)
        //{
        //    var roles = role.Split(new char[] { ',' });

        //    foreach (string r in roles)
        //    {
        //        var roleAccounts = this.account.Role_Account.ToList();
        //        foreach (var roleAccount in roleAccounts)
        //        {
        //            if (roleAccount.Role.Name.Contains(r.Trim()))
        //            {
        //                return true;
        //            }
        //        }
        //    }
        //    return false;
        //}


        public bool IsInRole(string role)
        {
            return role.Length > 2;
        }
    }
}
