using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackEnd.Models
{
    public class Cart
    {
        public int CartID { get; set; }
        public string AccountID { get; set; }
        public int CartCapacity { get; set; }
        public double CartTotal { get; set; }

        public Account Account { get; set; }
        public ICollection<CartDetail> CartDetails { get; set; }
    }
}
