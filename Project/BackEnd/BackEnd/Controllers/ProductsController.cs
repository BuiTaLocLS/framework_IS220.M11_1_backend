using BackEnd.Data;
using BackEnd.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackEnd.Controllers
{
    [Route("api/Product")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private WebContext _context;
        public ProductsController(WebContext context)
        {
            _context = context;
        }

        //Get
        [HttpGet]
        [Route("GetAll")]
        public async Task<IEnumerable<Product>> GetAllProduct()
        {
            var products = await (from p in _context.Products
                                  select p).ToListAsync();
            if (products != null)
            {
                return products;
            }
            else
            {
                return (IEnumerable<Product>)NoContent();
            }
        }

        //Get by ID
        [HttpGet]
        [Route("GetbyID/{id?}")]
        public async Task<ActionResult<Product>> GetbyID(int id)
        {

            var product = await (from p in _context.Products
                                  where p.ProductID.Equals(id)
                                  select p).FirstOrDefaultAsync();
            if (product != null)
            {
                return Ok(product);
            }
            else
            {
                return NotFound();
            }
        }
        //Get with producttype
        [HttpGet]
        [Route("GetbyType/{type?}")]
        public async Task<IEnumerable<Product>> GetByType(string type)
        {
            var list = await (from p in _context.Products
                              join t in _context.ProductTypes on p.ProductTypeID equals t.ProductTypeID
                              where t.ProductTypeName.Equals(type)
                              select p).ToListAsync();
            if (list != null)
            {
                return list;
            }
            else
            {
                return (IEnumerable<Product>)NotFound();
            }
        }

        //Post
        [HttpPost]
        [Route("Post")]
        public async Task<ActionResult<Product>> Post(Product product)
        {
            if (product != null)
            {
                _context.Products.Add(product);
                await _context.SaveChangesAsync();
                return Ok(product);
            }
            else
            {
                return NoContent();
            }
        }

        //Put
        [HttpPut]
        [Route("Put/{id?}")]
        public async Task<ActionResult<Product>> Put(int id, Product new_product)
        {
            if (id != new_product.ProductID)
            {
                return BadRequest();
            }
            var product = _context.Products.Find(id);
            if (product != null)
            {
                product.ProductName = new_product.ProductName;
                product.ProductTypeID = new_product.ProductTypeID;
                product.SupplierID = new_product.SupplierID;
                product.Price = new_product.Price;
                product.img_URL = new_product.img_URL;
                await _context.SaveChangesAsync();
                return Ok(new_product);
            }
            else
            {
                return NotFound();
            }
        }

        //Delete
        [HttpDelete]
        [Route("Delete/{id?}")]
        public async Task<ActionResult<Product>> Delete(int id)
        {
            var product = _context.Products.Find(id);
            if (product != null)
            {
                _context.Products.Remove(product);
                await _context.SaveChangesAsync();
                return Ok(product);
            }
            else
            {
                return NotFound();
            }
        }
    }
}
