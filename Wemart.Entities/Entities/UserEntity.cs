using System;
using System.Collections.Generic;
using System.Text;

namespace Wemart.Entities.Entities
{
    public class UserEntity
    {

        public int ID { get; set; }
        public string Name { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string Number { get; set; }
        public string Img { get; set; }
        public string Token { get; set; }
        public DateTime CreatedDate { get; set; } = DateTime.Now.Date;
        public TimeSpan CreatedTime { get; set; } = DateTime.Now.TimeOfDay;

    }
}

