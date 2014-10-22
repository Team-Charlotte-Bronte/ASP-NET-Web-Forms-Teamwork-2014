namespace Bookie.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public class BookComment
    {
        public BookComment()
        {
            this.DateCreated = DateTime.Now;
        }

        [Key]
        public int Id { get; set; }

        [Required]
        [MinLength(5), MaxLength(200)]
        public string Content { get; set; }

        public DateTime DateCreated { get; set; }

        public bool IsApproved { get; set; }

        [ForeignKey("Book")]
        public Guid BookId { get; set; }

        public virtual Book Book { get; set; }

        [ForeignKey("User")]
        public string UserId { get; set; }

        public virtual User User { get; set; }
    }
}