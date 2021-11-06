using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace BackEnd.Models
{
    public class Product
    {
        [Key]
        public int ProductID { get; set; }
        public int SupplierID { get; set; }
        [ForeignKey("SupplierID")]
        public int ProductTypeID { get; set; }
        [ForeignKey("ProductTypeID")]
        public string ProductName { get; set; }
        public double Price { get; set; }
        public string img_URL { get; set; }

        public Supplier Supplier { get; set; }
        public ProductType ProductType { get; set; }
        public ICollection<CartDetail> CartDetails { get; set; }
        public ICollection<Review> Reviews { get; set; }
        public ICollection<OrderDetail> OrderDetail { get; set; }
    }
}
