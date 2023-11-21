using Microsoft.AspNetCore.Mvc;
using WebApplication1.Models;
using WebApplication1.Service;

namespace WebApplication1.Controllers
{
    [ApiController]
    [Route("/account")]
    public class UserAccountController : Controller
    {
        public ApplicationDbContext dbContext;

        public UserAccountController(ApplicationDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        [HttpGet]
        public IActionResult Index()
        {

            if (dbContext.Users == null)
            {
                return NotFound();
            }
            return Ok(dbContext.Users.ToList());
        }

        [HttpPost("/account/register")]
        public IActionResult Register([FromBody] UserAccount user)
        {
            if(dbContext.Users.FirstOrDefault(u => u.email == user.email) != null)
            {
                return Ok(new
                {
                    Message = "Your email existed"
                });
            }
            dbContext.Users.Add(user);
            dbContext.SaveChanges();

            return Ok(new
            {
                Message = "Register Successful!"
            });
        }

        [HttpPost("/account/login")]
        public IActionResult Login([FromBody] UserAccount user)
        {
            if (dbContext.Users.FirstOrDefault(u => u.email == user.email && u.password == user.password) != null)
            {
                var token = TokenService.GenerateToken(user.email, 20);
                return Ok(new
                {
                    Token = token,
                    Message = "Login successfull"
                });
            }

            return Unauthorized(new
            {
                Message = "Your email or password is incorrect!"
            });
        }
        //public IActionResult Forbidden([FromBody] UserAccount user)
        //{
        //    return Ok(new
        //    {
        //        Message = "Please login to use this service"
        //    });

        //}

    }
}
