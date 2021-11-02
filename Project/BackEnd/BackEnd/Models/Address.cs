using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackEnd.Models
{
    public class Address
    {
        public int AddressID { get; set; }
        public string AccountID { get; set; }
        public string Diachi { get; set; }

        public Account Account { get; set; }
        public ICollection<Order> Orders { get; set; }
    }
}
