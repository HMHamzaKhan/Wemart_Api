using System;
using System.Collections.Generic;
using System.Text;

namespace Wemart.Entities.Entities
{
    public class CategoryEntity
    {
        public int ID { get; set; }
        public string CategoryName { get; set; }
        public string CategoryImg { get; set; }
        public bool IsApproved { get; set; }
        public int AddedBy { get; set; }
    }
}


