using Bookie.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bookie.Web.Books
{
    public partial class CreateBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                var categories = GetCategories();
                var categoryNames = categories.Select(x => x.Name).ToArray();
                foreach (var name in categoryNames)
                {
                    this.DropDownListCategories.Items.Add(name);
                }

                this.DropDownListCategories.DataBind();
                this.DropDownListCategories.SelectedIndex = 0;

                LoadSubCategories();
            }
        }

        private void LoadSubCategories()
        {
            var subCategories = GetSubCategories();
            var categoryId = GetCategoryId();
            var subCategoryNames = subCategories.Where(x => x.CategoryId == categoryId).Select(x => x.Name).ToArray();
            this.DropDownListSubCategories.Items.Clear();
            foreach (var name in subCategoryNames)
            {
                this.DropDownListSubCategories.Items.Add(name);
            }
            this.DropDownListSubCategories.DataBind();
            //this.DropDownListSubCategories.SelectedIndex = 0;
        }

        private IQueryable<SubCategory> GetSubCategories()
        {
            var _db = new Bookie.Data.BookieDbContext();
            IQueryable<SubCategory> query = _db.SubCategories;
            return query;
        }

        private IQueryable<Category> GetCategories()
        {
            var _db = new Bookie.Data.BookieDbContext();
            IQueryable<Category> query = _db.Categories;
            return query;
        }

        private IQueryable<Publisher> GetPublishers()
        {
            var _db = new Bookie.Data.BookieDbContext();
            IQueryable<Publisher> query = _db.Publishers;
            return query;
        }

        private Guid GetCategoryId() 
        {
            var categories = GetCategories();
            var categoryId = categories.Where(x => x.Name == this.DropDownListCategories.SelectedItem.Text).Select(x => x.Id).FirstOrDefault();
            return categoryId; 
        }
        private Guid GetSubCategoryId()
        {
            var subCategories = GetSubCategories();
            var subCategoryId = subCategories.Where(x => x.Name == this.DropDownListSubCategories.SelectedItem.Text).Select(x => x.Id).FirstOrDefault();
            return subCategoryId; 
        }

        private Guid GetPublisherId()
        {
            var publishers = GetPublishers();
            var publisherId = publishers.Where(x => x.Name == this.Publisher.Text).Select(x => x.Id).FirstOrDefault();
            if (publisherId == null)
            {
                var _db = new Bookie.Data.BookieDbContext();
                _db.Publishers.Add(new Publisher()
                {
                    Name = this.Publisher.Text
                });
                _db.SaveChanges();
                publisherId = publishers.Where(x => x.Name == this.Publisher.Text).Select(x => x.Id).FirstOrDefault();
            }
            return publisherId;
        }

        protected void CreateBook_Click(object sender, EventArgs e)
        {
            
            using (var db = new Bookie.Data.BookieDbContext())
            {
                var currentUser = db.Users.Where(x => x.UserName == this.User.Identity.Name).FirstOrDefault();
                var current = this.User;
                // TODO fix null reference exception
                var book = new Book() { 
                Name = this.Name.Text, 
                AuthorComment = this.AuthorComment.Text, 
                Isbn =  this.Isbn.Text,
                CategoryId = GetCategoryId(),
                SubCategoryId = GetSubCategoryId(),
                PublisherId = GetPublisherId(),
                DateAdded = DateTime.Now,
                CatalogNumber = int.Parse(this.CatalogNumber.Text),
                Description = this.Description.Text,
                NumberOfPages = int.Parse(this.NumberOfPages.Text),
                Year =  int.Parse(this.Year.Text),
                Price = int.Parse(this.Price.Text),
                IsAvailable = true,
                IsApproved=false,
                IsUsed = this.IsUsed.Checked,
                UserId = currentUser.Id.ToString()
                //Image
            };
                try
                {
                    db.Books.Add(book);
                }
                catch (Exception exp)
                {
                    throw new Exception("ERROR: Unable to Update Cart Item - " + exp.Message.ToString(), exp);
                }
            }
        }

        protected void DropDownListCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadSubCategories();
        }
    }
}