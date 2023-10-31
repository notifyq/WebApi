using API.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class SupportContentController : ControllerBase
    {
        [HttpPost]
        [Route("SendMessage")]
        public async Task<ActionResult<Content>> SendMessage(int support_request_id, int user_id, string message)
        {
            User user = ApplicationContext.Context.Users.Find(user_id);
            if (user == null)
            {
                return NotFound("Пользователь не найден");
            }
            Support support_request = ApplicationContext.Context.Supports.Find(support_request_id);
            if (support_request == null)
            {
                return NotFound("Запрос не найден");
            }

            int message_id = 1;
            if (ApplicationContext.Context.Contents.Count() != 0)
            {
                message_id = ApplicationContext.Context.Contents.Max(x => x.ContentsId) + 1;
            }

            Content message_content = new Content()
            {
                ContentsId = message_id,
                ContentMessege = message,
                SupportRequestId = support_request_id,
                Time = DateTime.Now,
                UserId = user_id,
            };
            ApplicationContext.Context.Contents.Add(message_content);
            ApplicationContext.Context.SaveChanges();
            return Ok(message_content);
        }

        [HttpGet]
        [Route("GetRequestMessages")]
        public async Task<ActionResult<List<Content>>> GetMessages(int support_request_id)
        {
            List<Content> support_request_messages = ApplicationContext.Context.Contents.Where(x => x.SupportRequestId == support_request_id).ToList();
            if (support_request_messages.Count == 0)
            {
                return NotFound("Сообщения не найдены");
            }
            return Ok(support_request_messages);
        }
    }
}
