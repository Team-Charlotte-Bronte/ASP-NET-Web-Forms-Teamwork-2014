namespace Bookie.Data.Contracts
{
    using System;
    using System.Linq;
    using Bookie.Models;

    public interface IBookieData : IDisposable
    {
        IGenericRepository<User> Users { get; }

        int SaveChanges();
    }
}