namespace Bookie.Web.Books
{
    using System;
    using System.IO;
    using System.Linq;
    using Bookie.EverliveAPI;
    using Bookie.EverliveAPI.Contracts;
    using Bookie.Models;
    using Bookie.Web.Infrastructure;
    using Bookie.Web.Models;

    public partial class CreateBook : BasePage
    {
        private IUserIdProvider userIdProvider = new AspNetUserIdProvider();
        private IImageUploader imageUploader = new ImageUploader();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                var categoryNames = this.Data.Categories.All()
                                        .Select(x => x.Name)
                                        .ToArray();

                foreach (var name in categoryNames)
                {
                    this.DropDownListCategories.Items.Add(name);
                }

                this.DropDownListCategories.DataBind();
                this.DropDownListCategories.SelectedIndex = 0;
                this.LoadSubCategories();
            }
        }

        protected void OnCreateBookButtonClicked(object sender, EventArgs e)
        {
            var currentUserId = this.userIdProvider.GetUserId();
            var numberOfBooks = this.Data.Books.All().Count();

            var book = new Book()
            {
                Name = this.Name.Text,
                AuthorComment = this.AuthorComment.Text,
                Isbn = this.Isbn.Text,
                CategoryId = this.GetCategoryId(),
                SubCategoryId = this.GetSubCategoryId(),
                PublisherId = this.GetPublisherId(),
                Description = this.Description.Text,
                IsUsed = this.IsUsed.Checked,
                UserId = currentUserId,
                CatalogNumber = numberOfBooks + 10000
            };

            this.ValidateNumberOfPages(book);
            this.ValidateYear(book);
            this.ValidatePrice(book);

            var memoryStream = new MemoryStream(this.Image.FileBytes);
            var imageUrl = this.imageUploader.UrlFromMemoryStream(memoryStream);
            book.ImageUrl = imageUrl;

            try
            {
                this.Data.Books.Add(book);
                this.Data.SaveChanges();
                this.Response.Redirect("Successful.aspx");
            }
            catch (Exception exp)
            {
                throw new Exception("Unable to Create Book - " + exp.Message.ToString(), exp);
            }
        }
 
        protected void OnDropDownListCategoriesSelectedIndexChanged(object sender, EventArgs e)
        {
            this.LoadSubCategories();
        }

        private void ValidatePrice(Book book)
        {
            decimal price;
            if (!decimal.TryParse(this.Price.Text, out price))
            {
                throw new ArgumentException("Invalid price!");
            }
            else
            {
                book.Price = price;
            }
        }
 
        private void ValidateYear(Book book)
        {
            int year;
            if (!int.TryParse(this.Year.Text, out year))
            {
                book.Year = null;
            }
            else
            {
                book.Year = year;
            }
        }
 
        private void ValidateNumberOfPages(Book book)
        {
            int numberOfPages;
            if (!int.TryParse(this.NumberOfPages.Text, out numberOfPages))
            {
                book.NumberOfPages = null;
            }
            else
            {
                book.NumberOfPages = numberOfPages;
            }
        }

        private void LoadSubCategories()
        {
            this.DropDownListSubCategories.Items.Clear();
            var categoryId = this.GetCategoryId();
            var subCategoryNames = this.Data.SubCategories.All()
                                       .Where(x => x.CategoryId == categoryId)
                                       .Select(x => x.Name)
                                       .ToArray();

            foreach (var name in subCategoryNames)
            {
                this.DropDownListSubCategories.Items.Add(name);
            }

            this.DropDownListSubCategories.DataBind();
            this.SubCategoriesDropDownContainer.Visible = subCategoryNames.Count() != 0;
        }

        private Guid GetCategoryId() 
        {
            var categoryId = this.Data.Categories.All()
                                 .Where(x => x.Name == this.DropDownListCategories.SelectedItem.Text)
                                 .Select(x => x.Id)
                                 .FirstOrDefault();
            return categoryId; 
        }

        private Guid? GetSubCategoryId()
        {
            if (this.DropDownListSubCategories.SelectedItem == null)
            {
                return null;
            }

            var subCategoryId = this.Data.SubCategories.All()
                                    .Where(x => x.Name == this.DropDownListSubCategories.SelectedItem.Text)
                                    .Select(x => x.Id)
                                    .FirstOrDefault();
            return subCategoryId; 
        }

        private Guid GetPublisherId()
        {
            var publisherId = this.Data.Publishers.All()
                                  .Where(x => x.Name == this.Publisher.Text)
                                  .Select(x => x.Id)
                                  .FirstOrDefault();

            if (publisherId == Guid.Empty)
            {
                this.Data.Publishers.Add(new Publisher()
                {
                    Name = this.Publisher.Text
                });

                this.Data.SaveChanges();

                var newPublisherId = this.Data.Publishers.All()
                                         .Where(x => x.Name == this.Publisher.Text)
                                         .Select(x => x.Id)
                                         .First();
                return newPublisherId;
            }

            return publisherId;
        }
    }
}