namespace Bookie.Data.Contracts
{
    using System;
    using System.Data.Entity;
    using System.Linq;
    using Bookie.Models;

    public interface IBookieDbContext : IDbContext
    {
        IDbSet<User> Users { get; set; }
    }
}