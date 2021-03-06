namespace Bookie.Data
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using Bookie.Common;
    using Bookie.Data.Contracts;
    using Bookie.Data.Migrations;
    using Bookie.Models;
    using Microsoft.AspNet.Identity.EntityFramework;

    public class BookieDbContext : IdentityDbContext<User>, IBookieDbContext
    {
        public BookieDbContext()
            : base(ConnectionStrings.CloudDatabaseConnection, throwIfV1Schema: false)
        {
            Database.SetInitializer<BookieDbContext>(new MigrateDatabaseToLatestVersion<BookieDbContext, Configuration>());
        }

        public IDbSet<Author> Authors { get; set; }

        public IDbSet<Book> Books { get; set; }

        public IDbSet<BookComment> BookComments { get; set; }

        public IDbSet<Publisher> Publishers { get; set; }

        public IDbSet<Category> Categories { get; set; }

        public IDbSet<SubCategory> SubCategories { get; set; }

        public IDbSet<PurchasedBook> PurchasedBooks { get; set; }

        public static BookieDbContext Create()
        {
            return new BookieDbContext();
        }

        public IDbSet<T> Set<T>() where T : class
        {
            return base.Set<T>();
        }

        public void SaveChanges()
        {
            base.SaveChanges();
        }
    }
}