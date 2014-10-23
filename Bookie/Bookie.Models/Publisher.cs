namespace Bookie.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.Linq;

    public class Publisher
    {
        private ICollection<Book> books;

        public Publisher()
        {
            this.Id = Guid.NewGuid();
            this.books = new HashSet<Book>();
        }

        [Key]
        public Guid Id { get; set; }

        [Required]
        [MinLength(2), MaxLength(100)]
        public string Name { get; set; }

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