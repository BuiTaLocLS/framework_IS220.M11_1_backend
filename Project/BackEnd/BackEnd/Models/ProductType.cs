using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace BackEnd.Models
{
    public class ProductType
    {
        [Key]
        public int ProductTypeID { get; set; }
        public string ProductTypeName { get; set; }

        public ICollection<Product> Products { get; set; }
    }
}
