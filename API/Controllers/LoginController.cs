using API.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        [HttpGet]
        public async Task<ActionResult<User>> Get(string login, string password)
        {
            User user = ApplicationContext.Context.Users.FirstOrDefault(x => x.UserPassword == password && x.UserLogin == login);
            if (user == null)
            {
                return new ObjectResult("Неверный логин или пароль") { StatusCode = StatusCodes.Status401Unauthorized };
            }

            return Ok(user);
        }
    }
}
