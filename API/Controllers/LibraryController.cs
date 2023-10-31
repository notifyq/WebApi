using API.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class LibraryController : ControllerBase
    {
        [HttpGet(("{user_id}"))]
        public async Task<ActionResult<List<Library>>> GetUserLibrary(int user_id)
        {
            User user = ApplicationContext.Context.Users.Find(user_id);
            if (user == null)
            {
                return NotFound("Пользователь не найден");
            }

            List<Library> user_library = ApplicationContext.Context.Libraries.Where(x => x.UserId == user_id && x.LibraryStatus == 5).ToList();

            /*if (user_library.Count == null)
            {
                return NotFound("Библиотека пуста");
            }*/

            return Ok(user_library);
        }

        [HttpPost]
        [Route("AddToLibrary")]
        public async Task<ActionResult<Library>> Add(int user_id, int product_id)
        {
            User user = ApplicationContext.Context.Users.Find(user_id);

            if (user == null)
            {
                return BadRequest("Пользователь не найден");
            }

            Product product = ApplicationContext.Context.Products.Find(product_id);
            if (product == null)
            {
                return BadRequest("Товар не найден");
            }
            if (product.ProductStatus != 3)
            {
                return Forbid("Товар находится не в продаже");
            }

            Library library = ApplicationContext.Context.Libraries.FirstOrDefault(x => x.ProductId == product_id && x.UserId == user_id);
            if (library != null)
            {
                return Conflict("У пользователя уже есть этот товар");
            }
            

            int library_id = ApplicationContext.Context.Libraries.Max(x => x.LibraryId) + 1;
            Library library_product = new Library()
            {
                LibraryId = library_id,
                LibraryStatus = 6,
                ProductId = product_id,
                UserId = user_id,
                PurchaseDate = DateTime.Now,
            };

            /*if (library_product.LibraryId == null)
            {
                library_product.LibraryId = 1;
            }*/

            ApplicationContext.Context.Libraries.Add(library_product);
            ApplicationContext.Context.SaveChanges();
            return new ObjectResult("Добавлено") { StatusCode = StatusCodes.Status201Created };

        }
        [HttpPut]
        [Route("ChangeStatus")]
        public async Task<ActionResult<Library>> ChageStatus(int library_id, int status_id)
        {
            Library library_product = ApplicationContext.Context.Libraries.Find(library_id);
            if (library_product == null)
            {
                return NotFound("Библиотека не найдена");
            }

            switch (status_id)
            {
                case 5:
                    library_product.LibraryStatus = status_id;
                    break;
                case 6:
                    library_product.LibraryStatus = status_id;
                    break;
                default:
                    return BadRequest();
                    break;
            }
            ApplicationContext.Context.SaveChanges();

            return Ok("Статус изменен на " + ApplicationContext.Context.Statuses.Find(status_id).StatusName);
        }
    }
}
