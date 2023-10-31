using API.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        [HttpGet("{user_id}")]
        public async Task<ActionResult<User>> Get(int user_id)
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
            List<User> users = ApplicationContext.Context.Users.ToList();
            if (users == null)
            {
                return NotFound("Пользователи не найдены");
            }

            return Ok(users);
        }
        [HttpPut]
        [Route("PutImage")]
        public async Task<ActionResult<User>> PutUserImage(int user_id,string image_path)
        {
            User user = ApplicationContext.Context.Users.Find(user_id);
            if (user == null) 
            {
                return NotFound("Пользователь не найден");
            }
            user.UserImage = image_path;
            ApplicationContext.Context.SaveChanges();
            return Ok("Изображение обновлено");
        }
        [HttpPut]
        [Route("ChangeStatus")]
        public async Task<ActionResult<User>> ChangeStatus(int user_id, bool status)
        {
            User user = ApplicationContext.Context.Users.Find(user_id);
            if (user == null)
            {
                return NotFound("Пользователь не найден");
            }
            
            if (status) 
            {
                user.UserStatus = 2; // online
            }
            else
            {
                user.UserStatus = 1; // offline
            }
            ApplicationContext.Context.SaveChanges();
            return Ok($"Статус изменен на {ApplicationContext.Context.Statuses.Find(user.UserStatus).StatusName}");
        }
    }
}
