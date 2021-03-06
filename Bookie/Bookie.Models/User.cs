namespace Bookie.Models
{
    using System.Collections.Generic;
    using System.Security.Claims;
    using System.Threading.Tasks;
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;

    public class User : IdentityUser
    {
        private ICollection<Book> books;
        private ICollection<BookComment> bookComments;
        private ICollection<PurchasedBook> purchasedBooks;

        public User()
        {
            this.books = new HashSet<Book>();
            this.bookComments = new HashSet<BookComment>();
            this.purchasedBooks = new HashSet<PurchasedBook>();
        }

        public virtual ICollection<Book> Books
        {
            get
            {
                return this.books;
            }
            set
            {
                this.books = value;
            }
        }

        public virtual ICollection<BookComment> BookComments
        {
            get
            {
                return this.bookComments;
            }
            set
            {
                this.bookComments = value;
            }
        }

        public virtual ICollection<PurchasedBook> PurchasedBooks
        {
            get
            {
                return this.purchasedBooks;
            }
            set
            {
                this.purchasedBooks = value;
            }
        }

        public Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<User> manager)
        {
            return Task.FromResult(this.GenerateUserIdentity(manager));
        }

        public ClaimsIdentity GenerateUserIdentity(UserManager<User> manager)
        {
            var userIdentity = manager.CreateIdentity(this, DefaultAuthenticationTypes.ApplicationCookie);
            return userIdentity;
        }
    }
}