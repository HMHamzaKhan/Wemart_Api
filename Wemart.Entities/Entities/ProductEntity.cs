using System;
using System.Collections.Generic;
using System.Text;

namespace Wemart.Entities.Entities
{
    public class ProductEntity
    {
        public int ID { get; set; }
        public int CatID { get; set; }
        public int ShopID { get; set; }
        public string Img { get; set; }
        public string Name { get; set; }
        public string Unit { get; set; }
        public decimal Price { get; set; }
        public bool IsApproved { get; set; }
        public DateTime CreatedDate { get; set; } = DateTime.Now.Date;
        public TimeSpan CreatedTime { get; set; } = DateTime.Now.TimeOfDay;
    }
}

