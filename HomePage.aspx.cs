using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace QuickStudyWebsite
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userName = "";
            userName = Session["username"]?.ToString();
            
        }

        protected void btnNextCard_Click(object sender, EventArgs e)
        {

        }

        protected void btnPrevCard_Click(object sender, EventArgs e)
        {

        }

        protected void btnNextDeck_Click(object sender, EventArgs e)
        {

        }

        protected void btnPrevDeck_Click(object sender, EventArgs e)
        {

        }
    }
}