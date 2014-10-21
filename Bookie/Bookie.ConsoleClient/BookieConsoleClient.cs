namespace Bookie.ConsoleClient
{
    using System;
    using System.Linq;
    using Bookie.Data.UnitOfWork;
    
    public class BookieConsoleClient
    {
        private static readonly BookieData bookieData = new BookieData();

        internal static void Main()
        {
            Console.WriteLine(bookieData.Users.All().Count());
        }
    }
}