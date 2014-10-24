using Bookie.Web.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bookie.Web.Latest
{
    public partial class Books : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var latestBooks = this.Data.Books.All()
               .Where(b => DbFunctions.AddHours(DateTime.Now, -1) < b.DateAdded).ToList();


            this.LatestBooks.DataSource = latestBooks;
            this.LatestBooks.DataBind();
        }
    }
}