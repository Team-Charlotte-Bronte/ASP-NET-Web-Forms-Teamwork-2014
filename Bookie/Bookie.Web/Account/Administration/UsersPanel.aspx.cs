namespace Bookie.Web.Account.Administration
{
    using Bookie.Web.Models;
    using System;
    using System.Linq;

    public partial class UsersPanel : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<Bookie.Models.User> GridViewUsers_GetData()
        {
            return this.Data.Users.All().OrderBy( u => u.Id);
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void GridViewUsers_UpdateItem(int id)
        {
            Bookie.Models.User item = null;
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
    }
}