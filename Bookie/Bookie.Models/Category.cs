namespace Bookie.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.Linq;

    public class Category
    {
        private ICollection<SubCategory> subCategories;
        private ICollection<Book> books;

        public Category()
        {
            this.subCategories = new HashSet<SubCategory>();
            this.books = new HashSet<Book>();
        }

        [Key]
        public Guid Id { get; set; }

        [Required]
        [MinLength(5), MaxLength(100)]
        public string Name { get; set; }

        public virtual ICollection<SubCategory> SubCategories
        {
            get
            {
                return this.subCategories;
            }
            set
            {
                this.subCategories = value;
            }
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
    }
}