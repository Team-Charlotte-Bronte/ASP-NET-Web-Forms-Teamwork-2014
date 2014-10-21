namespace Bookie.Web
{
    using Microsoft.Owin;
    using Owin;

    [assembly: OwinStartupAttribute(typeof(Bookie.Web.Startup))]
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            this.ConfigureAuth(app);
        }
    }
}