using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MVC_EF_DBFirst.Startup))]
namespace MVC_EF_DBFirst
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
