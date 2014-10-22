namespace Bookie.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;
    
    public class Book
    {
        private ICollection<Author> authors;
        private ICollection<BookComment> comments;

        public Book()
        {
            this.Id = Guid.NewGuid();
            this.authors = new HashSet<Author>();
            this.comments = new HashSet<BookComment>();
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

        public bool? IsAvailable { get; set; }

        public bool IsApproved { get; set; }

        public bool IsUsed { get; set; }

        public decimal Price { get; set; }

        [ForeignKey("User")]
        public string UserId { get; set; }

        public virtual User User { get; set; }

        [ForeignKey("Publisher")]
        public Guid PublisherId { get; set; }

        public virtual Publisher Publisher { get; set; }

        [ForeignKey("Category")]
        public Guid? CategoryId { get; set; }

        public virtual Category Category { get; set; }

        [ForeignKey("SubCategory")]
        public Guid? SubCategoryId { get; set; }

        public virtual SubCategory SubCategory { get; set; }

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

        public virtual ICollection<BookComment> Comments
        {
            get
            {
                return this.comments;
            }
            set
            {
                this.comments = value;
            }
        }
    }
}