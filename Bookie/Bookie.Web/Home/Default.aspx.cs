namespace Bookie.Web.Home
{
    using System;
    using System.Linq;
    using Bookie.Web.Models;

    public partial class _Default : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var books = this.Data.Books.All();

            var filterCategoryId = this.Request.QueryString["category"];
            if (filterCategoryId != null)
            {
                var subCategoryIdAsGuid = Guid.Parse(filterCategoryId);
                var subCategory = this.Data.SubCategories.Find(subCategoryIdAsGuid);
                if (subCategory != null)
                {
                    books = books.Where(b => b.SubCategoryId.Value == subCategoryIdAsGuid);
                }
            }

            var filterByName = this.Request.QueryString["search"];
            if (filterByName != null)
            {
                books = books.Where(b => b.Name.ToLower().Contains(filterByName.ToLower()));
            }
            
            this.BooksListView.DataSource = books.ToList();
            this.BooksListView.DataBind();
        }
    }
}