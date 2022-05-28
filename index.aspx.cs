using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace Project
{
#pragma warning disable IDE1006 // Naming Styles
    public partial class index : Page
#pragma warning restore IDE1006 // Naming Styles
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie authcookie = Request.Cookies["auth"]; 
            if (authcookie == null)
                Label1.Text = "Not Logged in";
            else
            {
                Label1.Text = "Logged in with ID: " + authcookie.Value.ToString();
            }
        }
    }
}