namespace Bookie.Web.Home
{
    using System;
    using System.Linq;
    using Bookie.Web.Models;

    public partial class _Default : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var books = this.Data.Books.All().ToList();

            this.BooksListView.DataSource = books;
            this.BooksListView.DataBind();
        }
    }
}