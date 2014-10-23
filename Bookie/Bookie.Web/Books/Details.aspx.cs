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
            string v = Request.QueryString["bookId"];
            if (v !=null)
            {
                Debug.WriteLine(v.ToString());
                var queryId = new Guid(v);
                var book = this.Data.Books.All().Where(x => x.Id == queryId).ToList();
                this.BookDetailsView.DataSource = book;
                this.BookDetailsView.DataBind();
            }
            else
            {
                Debug.WriteLine("Wrong parametter");
            }
        }
    }
}