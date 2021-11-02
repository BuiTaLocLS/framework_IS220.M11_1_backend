using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackEnd.Models
{
    public class CartDetail
    {
        public int ProductID { get; set; }
        public int CartID { get; set; }
        public int Capacity { get; set; }
        public double Money { get; set; }
        public DateTime AddDate { get; set; }

        public Cart Cart { get; set; }
        public Product Product { get; set; }
    }
}
