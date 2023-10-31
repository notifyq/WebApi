using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebApplication2.Model;

namespace WebApplication2.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        [HttpGet("{user_id}")]
        public async Task<ActionResult<User>> GetUser(int user_id)
        {
            User user = ApplicationContext.Context.Users.Find(user_id);
            if (user == null)
            {
                return NotFound("Пользователь не найден");
            }

            return Ok(user);
        }
        [HttpGet]
        public async Task<ActionResult<List<User>>> GetUsers()
        {
            List<User> user_list = ApplicationContext.Context.Users.ToList();
            if (user_list == null)
            {
                return NotFound("Пользователи не найден");
            }

            return Ok(user_list);
        }
    }
}
