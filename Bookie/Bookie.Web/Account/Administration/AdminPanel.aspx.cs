using Bookie.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bookie.Web.Account.Administration
{
    public partial class AdminPanel : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var usersCount = this.Data.Users.All().Count().ToString();
            var booksCount = this.Data.Books.All().Count().ToString();
            var commentsCount = this.Data.BookComments.All().Count().ToString();
            var pendingBooksCount = this.Data.Books.All().Where(b => !b.IsApproved).Count().ToString();
            var pendingCommetsCount = this.Data.BookComments.All().Where(c => !c.IsApproved).Count().ToString();

            this.LiteralUsersCount.Text = usersCount;
            this.LiteralBooksCount.Text = booksCount;
            this.LiteralCommentsCount.Text = commentsCount;
            this.LiteralPendingBooks.Text = pendingBooksCount;
            this.LiteralPendingComments.Text = pendingCommetsCount;

        }
    }
}