using System;
using System.Collections.Generic;
using System.Text;

namespace Wemart.Entities.Entities
{
    public class OrderRouteEntity
    {
        public int ID { get; set; }
        public int OrderID { get; set; }
        public decimal Latitude { get; set; }
        public decimal Longitude { get; set; }
    }
}
