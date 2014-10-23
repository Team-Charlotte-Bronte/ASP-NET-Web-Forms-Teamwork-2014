namespace Bookie.Web.Account.Administration
{
    using System;
    using System.Linq;
    using Bookie.Models;
    using Bookie.Web.Models;

    public partial class BooksPanel : BasePage
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
            var books = this.Data.Books.All();

            return books.OrderBy(b => b.Id);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void GridViewBooks_SelectedIndexChanged(object sender, EventArgs e)
        {
            var id = this.GridViewBooks.SelectedDataKey.Value.ToString();
            this.FormViewDetails.DataSource = this.Data.Books.All().Where(b => b.Id.ToString() == id).ToArray();
            this.FormViewDetails.DataBind();
        }
    }
}