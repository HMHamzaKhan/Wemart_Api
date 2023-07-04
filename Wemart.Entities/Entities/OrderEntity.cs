using System;
using System.Collections.Generic;
using System.Text;

namespace Wemart.Entities.Entities
{
    public class OrderEntity
    {
        public int ID { get; set; }
        public string Email { get; set; }
        public int ShopID { get; set; }
        public int UserID { get; set; }
        public decimal TotalPrice { get; set; }
        public DateTime CreatedDate { get; set; } = DateTime.Now.Date;
        public TimeSpan CreatedTime { get; set; } = DateTime.Now.TimeOfDay;
        public bool IsApproved { get; set; }
        public int RiderID { get; set; }
        public short StatusID { get; set; }
        public string Location { get; set; }
        public decimal Latitude { get; set; }
        public decimal Longitude { get; set; }
    }
}

