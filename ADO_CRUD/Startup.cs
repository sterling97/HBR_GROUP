using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ADO_CRUD.Startup))]
namespace ADO_CRUD
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
