using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackEnd.Models
{
    public enum Ranking 
    { 
        bad, normal, excellent
    }
    public class Review
    {
        public int ProductID { get; set; }
        public string AccountID { get; set; }
        public Ranking Ranking { get; set; }
        public string Comment { get; set; }
        public DateTime CreatedDate { get; set; }

        public Account Account { get; set; }
        public Product Product { get; set; }
    }
}
