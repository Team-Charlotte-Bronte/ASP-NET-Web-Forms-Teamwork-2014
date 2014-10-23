namespace Bookie.Web.Models
{
    using System;
    using System.Linq;
    using System.Web.UI;
    using Bookie.Data;
    using Bookie.Data.Contracts;

    public class BaseMasterPage : MasterPage
    {
        private IBookieData data;

        public BaseMasterPage()
            : this(new BookieData())
        {
        }

        public BaseMasterPage(IBookieData data)
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