using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    [ApiController]
    [Route("/Products")]
    public class ProductController : ControllerBase
    {
        public ApplicationDbContext dbContext;

        public ProductController(ApplicationDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        [AllowAnonymous]
        [HttpGet]
        public IActionResult Index()
        {
            if (dbContext.Products == null)
            {
                return NotFound();
            }
            return Ok(dbContext.Products.ToList());
        }

        [AllowAnonymous]
        [HttpGet("{id}")]
        public IActionResult GetById(int id) {
            var product = dbContext.Products.FirstOrDefault(p => p.Id == id);
            return Ok(new
            {
                Message = "Detail of product " + id,
                Data = product
            });
        }

        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult DeleteProductById(int id)
        {
            var product = dbContext.Products.FirstOrDefault(p => p.Id == id);
            dbContext.Products.Remove(product);
            dbContext.SaveChanges();
            return Ok(new
            {
                Message = "Detail of product " + id,
                Data = product
            });
        }

        [Authorize]
        [HttpPost]
        public IActionResult AddProduct(Product product)
        {
            dbContext.Products.Add(product);
            dbContext.SaveChanges();
            return Ok(new
            {
                Message = "Add successfull",
                Data = product
            });
        }

        [Authorize]
        [HttpPut("{id}")]
        public IActionResult UpdateProduct(int id, [FromBody] Product p)
        {
            var product = dbContext.Products.FirstOrDefault(p => p.Id == id);
            product.Name = p.Name;
            product.Description = p.Description;
            product.Price = p.Price;
            dbContext.SaveChanges();
            return Ok(new
            {
                Message = "Add successfull",
                Data = product
            });

        }
    }
}
