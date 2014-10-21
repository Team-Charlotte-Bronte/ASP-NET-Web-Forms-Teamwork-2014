namespace Bookie.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.Linq;

    public class UserComment
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [MinLength(5), MaxLength(200)]
        public string Content { get; set; }

        public string AuthorId { get; set; }

        public Author Author { get; set; }
    }
}