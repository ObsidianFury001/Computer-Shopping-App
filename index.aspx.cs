using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace Project
{
    public partial class index : System.Web.UI.Page
    {
        String connectionString = "server=localhost;user id=root;password=root;database=website";

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}