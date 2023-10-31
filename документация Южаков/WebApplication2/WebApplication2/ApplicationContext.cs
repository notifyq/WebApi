using WebApplication2.Model;

namespace WebApplication2
{
    public class ApplicationContext: testschemaContext
    {
        public static testschemaContext Context { get; } = new testschemaContext();
    }
}
