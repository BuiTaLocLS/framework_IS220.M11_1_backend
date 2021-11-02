using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackEnd.Models
{
    public class Account
    {
        public string AccountID { get; set; }
        public string AccountPassword { get; set; }
        public int UserID { get; set; }
        public bool IsAdmin { get; set; }
        public DateTime CreatedDate { get; set; }
        public bool IsActive { get; set; }

        public User User { get; set; }
        public ICollection<SearchHistory> SearchHistorys { get; set; }
        public Cart Cart { get; set; }
        public ICollection<Review> Reviews { get; set; }
        public ICollection<Order> Orders { get; set; }
        public ICollection<Address> Addresses { get; set; }
    }
}
