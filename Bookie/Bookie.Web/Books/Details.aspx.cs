using Bookie.Web.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bookie.Web.Books
{
    public partial class Details : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        { 
            var queryId = new Guid("EEEB0180-2D68-40A6-80FE-F2568745E765");
            var book = this.Data.Books.All().Where(x => x.Id == queryId).ToList();
            this.BookDetailsView.DataSource = book;
        }
    }
}