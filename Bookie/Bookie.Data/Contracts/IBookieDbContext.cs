namespace Bookie.Data.Contracts
{
    using System;
    using System.Data.Entity;
    using System.Linq;
    using Bookie.Models;

    public interface IBookieDbContext : IDbContext
    {
        IDbSet<User> Users { get; set; }

        IDbSet<Author> Authors { get; set; }

        IDbSet<Book> Books { get; set; }

        IDbSet<BookComment> BookComments { get; set; }

        IDbSet<Publisher> Publishers { get; set; }

        IDbSet<Category> Categories { get; set; }

        IDbSet<SubCategory> SubCategories { get; set; }

        IDbSet<PurchasedBook> PurchasedBooks { get; set; }
    }
}