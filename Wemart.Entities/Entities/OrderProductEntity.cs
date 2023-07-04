using System;
using System.Collections.Generic;
using System.Text;

namespace Wemart.Entities.Entities
{
    public class OrderProductEntity
    {
        public int ID { get; set; }
        public int OrderID { get; set; }
        public int ProductID { get; set; }
        public int Quantity { get; set; }
        public decimal TotalPrice { get; set; }
        //public double TotalPrice { get; set; }
    }
}
