namespace Bookie.Web.Books
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using Bookie.Models;
    using Bookie.Web.Models;

    public partial class Details : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string bookId = this.Request.QueryString["book"];
            if (bookId != null)
            {
                var queryId = new Guid(bookId);
                var book = this.Data.Books.All().Where(x => x.Id == queryId).FirstOrDefault();
                if (book == null)
                {
                    this.Response.Redirect("/");
                }

                this.BookDetailsView.DataSource = new List<Book> { book };
                this.BookDetailsView.DataBind();
            }
            else
            {
                this.Response.Redirect("/");
            }
        }
    }
}