namespace Bookie.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.Linq;
    
    public class Book
    {
        private ICollection<Author> authors;

        public Book()
        {
            this.Id = Guid.NewGuid();
            this.authors = new HashSet<Author>();
        }

        [Key]
        public Guid Id { get; set; }

        public int CatalogNumber { get; set; }

        [Required]
        [MinLength(2), MaxLength(120)]
        public string Name { get; set; }

        [MaxLength(5000)]
        public string Description { get; set; }

        [MaxLength(1000)]
        public string AuthorComment { get; set; }

        public string Isbn { get; set; }

        [Range(0, 5000)]
        public int? NumberOfPages { get; set; }

        public int? Year { get; set; }

        public byte[] Image { get; set; }

        public string Publisher { get; set; }

        public bool? IsAvailable { get; set; }

        public bool IsUsed { get; set; }

        public decimal Price { get; set; }

        public virtual ICollection<Author> Authors
        {
            get
            {
                return this.authors;
            }
            set
            {
                this.authors = value;
            }
        }
    }
}