namespace Bookie.Web.Account.Administration
{
    using System;
    using System.Linq;
    using System.Web;
    using Bookie.Models;
    using Bookie.Web.Models;

    public partial class BooksApprove : BasePage
    {
        public void GridViewBooks_UpdateItem(Guid id)
        {
            var book = this.Data.Books.Find(id);
            if (book == null)
            {
                this.ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                return;
            }

            this.TryUpdateModel(book);

            if (this.ModelState.IsValid)
            {
                this.Data.SaveChanges();
            }
        }

        public IQueryable<Book> GridViewBooks_GetData()
        {
            var books = this.Data.Books.All().Where(b => !b.IsApproved);
            return books;
        }

        protected void GridViewBooks_SelectedIndexChanged(object sender, EventArgs e)
        {
            var id = Guid.Parse(this.GridViewBooks.SelectedDataKey.Value.ToString());
            var book = this.Data.Books.Find(id);
            book.IsApproved = true;
            this.Data.SaveChanges();
            this.Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri);
        }
    }
}