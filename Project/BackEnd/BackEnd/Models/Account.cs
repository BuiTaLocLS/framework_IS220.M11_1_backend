using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace BackEnd.Models
{
    public class Account
    {
        [Key]
        public string AccountID { get; set; }
        public string AccountPassword { get; set; }
        public int UserID { get; set; }
        [ForeignKey("UserID")]
        public bool IsAdmin { get; set; }
        [DisplayFormat(DataFormatString = "0:dd/MM/yyyy", ApplyFormatInEditMode = true)]
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
