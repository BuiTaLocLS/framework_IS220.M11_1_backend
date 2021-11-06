using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace BackEnd.Models
{
    public class Address
    {
        [Key]
        public int AddressID { get; set; }
        public string AccountID { get; set; }
        [ForeignKey("AccountID")]
        public string Diachi { get; set; }

        public Account Account { get; set; }
        public ICollection<Order> Orders { get; set; }
    }
}
