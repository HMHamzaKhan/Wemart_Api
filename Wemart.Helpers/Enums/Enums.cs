using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;

namespace Wemart.Helpers.Enums
{
    public enum UserTypes
    {

        Admin = 1,
        Shop = 2,
        User = 3,
        Rider = 4

    }

    public enum StatusTypes { NotApproved = 1, Approved = 2, OnTheWay = 3, Delivered = 4 }

    public enum EmailBodyEnum
    {
        [Description("ForgotPassword.txt")]
        ForgotPassword = 1,

        [Description("Invoice.txt")]
        Invoice = 2
    }
}
