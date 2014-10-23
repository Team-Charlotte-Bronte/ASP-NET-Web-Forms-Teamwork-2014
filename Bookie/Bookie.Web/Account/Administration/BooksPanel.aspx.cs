namespace Bookie.Web.Account.Administration
{
    using System;
    using System.Linq;
    using Bookie.Models;
    using Bookie.Web.Models;
    using System.Web.UI.WebControls;

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

        protected void GridViewBooks_SelectedIndexChanged(object sender, EventArgs e)
        {
            var id = this.GridViewBooks.SelectedDataKey.Value.ToString();
            this.FormViewDetails.DataSource = this.Data.Books.All().Where(b => b.Id.ToString() == id).ToArray();
            this.FormViewDetails.DataBind();
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void FormViewDetails_UpdateItem(int id)
        {
            Bookie.Models.Book item = null;
            // Load the item here, e.g. item = MyDataLayer.Find(id);
            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                return;
            }
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                // Save changes here, e.g. MyDataLayer.SaveChanges();

            }
        }

        protected void FormViewDetails_ModeChanging(object sender, System.Web.UI.WebControls.FormViewModeEventArgs e)
        {
            this.FormViewDetails.ChangeMode(FormViewMode.Edit);
        }

        protected void Cancel(object sender, EventArgs e)
        {
            this.FormViewDetails.ChangeMode(FormViewMode.ReadOnly);
        }
    }
}