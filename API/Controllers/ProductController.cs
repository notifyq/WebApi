using API.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        [HttpGet]
        [Route("ProductList")]
        public async Task<ActionResult<List<Product>>> GetProductList()
        {
            List<Product> product_list = ApplicationContext.Context.Products.ToList();
            if (product_list.Count == 0)
            {
                return NotFound();
            }

            return product_list;
        }
        [HttpGet("{product_id}")]
        public ActionResult<Product> GetProduct(int product_id)
        {
            Product product = ApplicationContext.Context.Products.Find(product_id);
            if (product == null)
            {
                return NotFound();
            }
            return Ok(product);
        }

        [HttpPost]
        [ActionName("AddProduct")]
        [Route("AddProduct")]
        public async Task<ActionResult<Product>> AddProduct(Product product)
        {
            if (product == null)
            {
                return BadRequest();
            }
            if (ApplicationContext.Context.Products.Find(product.ProductId) != null)
            {
                return Conflict($"Товар с {product.ProductId} уже сущетсвует") ;
            }

            ApplicationContext.Context.Add(product);
            ApplicationContext.Context.SaveChanges();

            return new ObjectResult("Товар добавлен") { StatusCode = StatusCodes.Status201Created };
        }
        [HttpPut]
        [Route("ChangeStatus")]
        public async Task<ActionResult<Product>> ChangeStatus(int product_id, int status_id)
        {
            Product product = ApplicationContext.Context.Products.Find(product_id);
            if (product == null)
            {
                return BadRequest("Товар не найден");
            }
            switch (status_id)
            {
                case 3:
                    product.ProductStatus = 3;
                    break;
                case 4:
                    product.ProductStatus = 4;
                    break;
                default:
                    return BadRequest("Статус может быть в продаже или не в продаже");
                    break;
            }
            return Ok("Статус товара изменен на " + ApplicationContext.Context.Statuses.Find(status_id).StatusName);
        }
    }
}
