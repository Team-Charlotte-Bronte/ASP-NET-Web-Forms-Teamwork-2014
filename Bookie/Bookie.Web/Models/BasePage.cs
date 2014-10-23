namespace Bookie.Web.Models
{
    using System;
    using System.Linq;
    using System.Web.UI;
    using Bookie.Data;
    using Bookie.Data.Contracts;

    public class BasePage : Page
    {
        private IBookieData data;

        public BasePage()
            : this(new BookieData())
        {
        }

        public BasePage(IBookieData data)
        {
            this.data = data;
        }

        protected IBookieData Data
        {
            get
            {
                return this.data;
            }
            set
            {
                this.data = value;
            }
        }
    }
}