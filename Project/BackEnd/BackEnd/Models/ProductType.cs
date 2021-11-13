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

        [StringLength(50, ErrorMessage = "Không vượt quá 50 kí tự!")]
        public string ProductTypeName { get; set; }

        public ICollection<Product> Products { get; set; }
    }
}
