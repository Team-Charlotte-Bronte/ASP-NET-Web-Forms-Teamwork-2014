namespace Bookie.Data.Migrations
{
    using System;
    using System.Collections.Generic;
    using System.Data.Entity.Migrations;
    using System.Linq;
    using Bookie.Models;

    internal sealed class Configuration : DbMigrationsConfiguration<BookieDbContext>
    {
        public Configuration()
        {
            this.AutomaticMigrationsEnabled = true;
            this.AutomaticMigrationDataLossAllowed = true;
        }

        protected override void Seed(BookieDbContext context)
        {
            this.SeedCategories(context);
        }
 
        private void SeedCategories(BookieDbContext context)
        {
            if (context.Categories.Any() || context.SubCategories.Any())
            {
                return;
            }

            context.Categories.Add(new Category()
            {
                Name = "10th grade",
                SubCategories = new List<SubCategory>()
                {
                    new SubCategory()
                    {
                        Name = "Math"
                    },
                    new SubCategory()
                    {
                        Name = "Informatics"
                    },
                    new SubCategory()
                    {
                        Name = "English"
                    },
                    new SubCategory()
                    {
                        Name = "German"
                    }
                }
            });

            context.Categories.Add(new Category()
            {
                Name = "11th grade",
                SubCategories = new List<SubCategory>()
                {
                    new SubCategory()
                    {
                        Name = "Math"
                    },
                    new SubCategory()
                    {
                        Name = "Informatics"
                    },
                    new SubCategory()
                    {
                        Name = "English"
                    },
                    new SubCategory()
                    {
                        Name = "German"
                    },
                    new SubCategory()
                    {
                        Name = "French"
                    },
                    new SubCategory()
                    {
                        Name = "Russian"
                    }
                }
            });

            context.Categories.Add(new Category()
            {
                Name = "12th grade",
                SubCategories = new List<SubCategory>()
                {
                    new SubCategory()
                    {
                        Name = "Math"
                    },
                    new SubCategory()
                    {
                        Name = "Informatics"
                    },
                    new SubCategory()
                    {
                        Name = "English"
                    },
                    new SubCategory()
                    {
                        Name = "Physics and Astronomy"
                    },
                    new SubCategory()
                    {
                        Name = "World and personality"
                    }
                }
            });

            //context.Categories.Add(new Category()
            //{
            //    Name = "New editions"
            //});

            context.Categories.Add(new Category()
            {
                Name = "External evaluation",
                SubCategories = new List<SubCategory>()
                {
                    new SubCategory()
                    {
                        Name = "4th grade"
                    },
                    new SubCategory()
                    {
                        Name = "7th grade"
                    },
                    new SubCategory()
                    {
                        Name = "8th grade"
                    }
                }
            });

            context.Categories.Add(new Category()
            {
                Name = "Aids for matura",
                SubCategories = new List<SubCategory>()
                {
                    new SubCategory()
                    {
                        Name = "Math"
                    },
                    new SubCategory()
                    {
                        Name = "Informatics"
                    },
                    new SubCategory()
                    {
                        Name = "English"
                    },
                    new SubCategory()
                    {
                        Name = "Physics and Astronomy"
                    }
                }
            });

            context.SaveChanges();
        }
    }
}