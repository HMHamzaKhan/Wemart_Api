using System;
using System.Collections.Generic;
using System.Text;
using Wemart.Entities.Entities;

namespace Wemart.Entities.ViewModels.AppVM
{
    public class OrderDetailVM
    {
        public OrderEntity OrderMaster { get; set; }
        public List<OrderProductEntity> OrderProducts { get; set; }
    }
}
