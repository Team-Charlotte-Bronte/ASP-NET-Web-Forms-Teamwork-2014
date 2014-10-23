namespace Bookie.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public class PurchasedBook
    {
        public PurchasedBook()
        {
            this.DatePurchased = DateTime.Now;
        }

        [Key]
        public int Id { get; set; }

        public DateTime DatePurchased { get; set; }

        [ForeignKey("Book")]
        public Guid BookId { get; set; }

        public virtual Book Book { get; set; }

        [ForeignKey("User")]
        public string UserId { get; set; }

        public virtual User User { get; set; }
    }
}