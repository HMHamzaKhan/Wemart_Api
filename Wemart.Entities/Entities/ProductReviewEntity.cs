using System;
using System.Collections.Generic;
using System.Text;

namespace Wemart.Entities.Entities
{
    public class ProductReviewEntity
    {
        public int ID { get; set; }
        public int UserID { get; set; }
        public int ProductID { get; set; }
        public DateTime ReviewOn { get; set; } = DateTime.Now;
        public int Rating { get; set; }
        public string Comments { get; set; }
    }
}
