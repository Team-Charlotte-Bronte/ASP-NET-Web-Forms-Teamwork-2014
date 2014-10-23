using Bookie.Models;
using Bookie.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bookie.Web.Account.Administration
{
    public partial class BooksPanel : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void GridViewBooks_UpdateItem(int id)
        {
            Book item = null;
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

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<Book> GridViewBooks_GetData()
        {
            var books = this.Data.Books.All();

            return books.OrderBy(b => b.Id);
        }
    }
}