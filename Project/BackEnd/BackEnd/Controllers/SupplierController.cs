using Microsoft.AspNetCore.Mvc;
using System.Linq;
using System.Threading.Tasks;
using BackEnd.Data;
using BackEnd.Models;
using static System.Console;
using System;
using System.Collections;
using System.Collections.Generic;

namespace BackEnd.Controllers
{
    [Route("api/Supplier")]
    [ApiController]
    public class SupplierController : ControllerBase
    {
        private WebContext _context;
        public SupplierController(WebContext context)
        {
            _context = context;
        }

        //Get       
        [HttpGet]
        public IEnumerable<Supplier> GetSuppliers()
        {
            var suppliers = _context.Suppliers;

            if (suppliers != null)
                return suppliers.ToList();
            else
                return (IEnumerable<Supplier>)NoContent();
        }
        //Get with id
        [HttpGet("{id}")]
        public ActionResult<Supplier> GetSuppliers(int id)
        {
            var supplier = _context.Suppliers.Find(id);

            if (supplier != null)
                return supplier;
            else
                return NoContent();
        }
        //Post
        [HttpPost]
        public ActionResult<Supplier> Post(Supplier supplier)
        {
            if (supplier != null)
            {
                _context.Suppliers.Add(supplier);
                _context.SaveChanges();
                return supplier;
            }
            else
                return NoContent();
            
        }
        //Put
        [HttpPut("{id}")]
        public ActionResult<Supplier> Put(int id,Supplier new_supplier)
        {
            if (id != new_supplier.SupplierID)
            {
                return BadRequest();
            }
            var supplier = _context.Suppliers.Find(id);
            if (supplier != null)
            {
                supplier.SupplierID = new_supplier.SupplierID;
                supplier.SupplierName = new_supplier.SupplierName;
                supplier.SupplierAddress = new_supplier.SupplierAddress;
                _context.SaveChanges();
                return supplier;
            }
            else
            {
                return NoContent();
            }           
        }
        //Delete
        [HttpDelete("{id}")]
        public ActionResult<Supplier> Put(int id)
        {
            var supplier = _context.Suppliers.Find(id);
            if (supplier != null)
            {
                _context.Suppliers.Remove(supplier);
                _context.SaveChanges();
                return supplier;
            }
            else
            {
                return NoContent();
            }
        }
    }
}
