namespace Bookie.ConsoleClient
{
    using System;
    using System.Linq;
    using Bookie.Data;

    public class BookieConsoleClient
    {
        private static readonly BookieData bookieData = new BookieData();

        internal static void Main()
        {
            Console.WriteLine("Number of users: {0}", bookieData.Users.All().Count());

            foreach (var category in bookieData.Categories.All().ToList())
            {
                Console.WriteLine("{0} -> {1}", category.Name, string.Join(", ", category.SubCategories.Select(c => c.Name)));
            }
        }
    }
}