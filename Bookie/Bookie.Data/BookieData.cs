namespace Bookie.Data
{
    using System;
    using System.Collections.Generic;
    using System.Data.Entity;
    using System.Linq;
    using Bookie.Data.Contracts;
    using Bookie.Data.Repositories;
    using Bookie.Models;

    public class BookieData : IBookieData
    {
        private readonly DbContext context;
        private readonly IDictionary<Type, object> repositories = new Dictionary<Type, object>();

        public BookieData()
            : this(new BookieDbContext())
        {
        }

        public BookieData(DbContext context)
        {
            this.context = context;
        }

        public IGenericRepository<User> Users
        {
            get
            {
                return this.GetRepository<User>();
            }
        }

        public IGenericRepository<Author> Authors
        {
            get
            {
                return this.GetRepository<Author>();
            }
        }

        public IGenericRepository<Book> Books
        {
            get
            {
                return this.GetRepository<Book>();
            }
        }

        public IGenericRepository<BookComment> BookComments
        {
            get
            {
                return this.GetRepository<BookComment>();
            }
        }

        public IGenericRepository<Publisher> Publishers
        {
            get
            {
                return this.GetRepository<Publisher>();
            }
        }

        public IGenericRepository<Category> Categories
        {
            get
            {
                return this.GetRepository<Category>();
            }
        }

        public IGenericRepository<SubCategory> SubCategories
        {
            get
            {
                return this.GetRepository<SubCategory>();
            }
        }

        public IGenericRepository<PurchasedBook> PurchasedBooks
        {
            get
            {
                return this.GetRepository<PurchasedBook>();
            }
        }

        public int SaveChanges()
        {
            return this.context.SaveChanges();
        }

        public void Dispose()
        {
            this.Dispose(true);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
            {
                if (this.context != null)
                {
                    this.context.Dispose();
                }
            }
        }

        private IGenericRepository<T> GetRepository<T>() where T : class
        {
            var typeOfModel = typeof(T);

            if (!this.repositories.ContainsKey(typeOfModel))
            {
                var typeOfRepository = typeof(GenericRepository<T>);

                this.repositories.Add(typeOfModel, Activator.CreateInstance(typeOfRepository, this.context));
            }

            return (IGenericRepository<T>)this.repositories[typeOfModel];
        }
    }
}