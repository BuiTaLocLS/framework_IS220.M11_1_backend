using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackEnd.Models
{
    public class ProductType
    {
        public int ProductTypeID { get; set; }
        public string ProductTypeName { get; set; }

        public ICollection<Product> Products { get; set; }
    }
}
