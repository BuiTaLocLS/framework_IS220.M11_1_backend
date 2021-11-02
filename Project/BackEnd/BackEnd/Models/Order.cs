using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackEnd.Models
{
    public enum Status
    {
        waitforconfirm, shipping, success, cancel
    }
    public class Order
    {
        public int OrderID { get; set; }
        public int AddressID { get; set; }
        public string AccountID { get; set; }
        public DateTime CreatedDate { get; set; }
        public Status Status { get; set; }
        public double Total { get; set; }

        public Account Account { get; set; }
        public Address Address { get; set; }
        public ICollection<OrderDetail> OrderDetail { get; set; }
    }
}
