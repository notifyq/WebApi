using API.Model;

namespace API
{
    public class ApplicationContext: teamprojectContext
    {
        public static teamprojectContext Context { get; } = new teamprojectContext();
    }
}
