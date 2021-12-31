using BackEnd.Data;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using BackEnd.Models;

namespace BackEnd.Controllers
{
    [Route("api/CartDetail")]
    [ApiController]
    public class CartDetailController : ControllerBase
    {
        private WebContext _context;
        public CartDetailController (WebContext context)
        {
            _context = context;
        }
    //Get All
        [HttpGet]
        [Route("GetAll")]
        public async Task<IEnumerable<CartDetail>> GetAll()
        {
            var cartdetails = await (from A in _context.CartDetails
                              select A).ToListAsync();
            if (cartdetails != null)
            {
                return cartdetails;
            }
            else
            {
                return (IEnumerable<CartDetail>)NotFound();
            }
        }

        [HttpGet]
        [Route("GetwithAcc/{acc?}")]
        public async Task<IEnumerable<CartDetail>> GetwithAcc(string acc)
        {
            var cartdetails = await (from A in _context.CartDetails
                                     join C in _context.Carts on A.CartID equals C.CartID
                                     where C.AccountID.Equals(acc)
                                     select A).ToListAsync();
            if (cartdetails != null)
            {
                return cartdetails;
            }
            else
            {
                return (IEnumerable<CartDetail>)NotFound();
            }
        }

        //Get by cartID+productID
        [HttpGet]
        [Route("GetbyID/{id1?}/{id2?}")]
        public async Task<ActionResult<CartDetail>> GetbyID(int id1, int id2)
        {

            var cartdetail = await (from c in _context.CartDetails
                                  where c.CartID.Equals(id1) && c.ProductID.Equals(id2)
                                  select c).FirstOrDefaultAsync();
            if (cartdetail != null)
            {
                return Ok(cartdetail);
            }
            else
            {
                return NotFound();
            }
        }

     

        //Post
        [HttpPost]
        [Route("Post")]
        public async Task<ActionResult<CartDetail>> Post(CartDetail cartdetail)
        {
            if (cartdetail != null)
            {
                _context.CartDetails.Add(cartdetail);
                var cart = _context.Carts.Find(cartdetail.CartID);
                if (cart != null)
                {
                    cart.CartCapacity += 1;
                    cart.CartTotal += cartdetail.Money;
                }
                await _context.SaveChangesAsync();
                return Ok(cartdetail);
            }
            else
            {
                return NoContent();
            }
        }

        //Put CardID + ProductID
        [HttpPut]
        [Route("Put/{id1?}/{id2?}/")]
        public async Task<ActionResult<CartDetail>> Put(int id1,int id2 , CartDetail new_add)
        {
            if (id1 != new_add.CartID & id2 != new_add.ProductID)
            {
                return BadRequest();
            }

            var add = _context.CartDetails.Find(id1,id2);
            if (add != null)
            {
                var cart = _context.Carts.Find(id1);
                if (cart != null)
                {                   
                    cart.CartTotal = cart.CartTotal - add.Money + new_add.Money;
                }
                add.Capacity = new_add.Capacity;
                add.Money = new_add.Money;
                add.AddDate = new_add.AddDate;
                await _context.SaveChangesAsync();
                return Ok(add);
            }
            else
            {
                return NotFound();
            }
        }

          //Delete cart ID + Product ID
        [HttpDelete]
        [Route("Delete/{id1?}/{id2?}/")]
        public async Task<ActionResult<CartDetail>> Delete(int id1, int id2)
        {
            var cartdetail = _context.CartDetails.Find(id1,id2);
            if (cartdetail != null)
            {
                _context.CartDetails.Remove(cartdetail);
                var cart = _context.Carts.Find(cartdetail.CartID);
                if (cart != null)
                {
                    cart.CartCapacity -= 1;
                    cart.CartTotal -= cartdetail.Money;
                }              
                await _context.SaveChangesAsync();
                return cartdetail;
            }
            else
            {
                return NotFound();
            }
        }
    }
}