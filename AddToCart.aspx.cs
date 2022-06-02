using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class AddToCart : System.Web.UI.Page
    {
        const String connectionString = "server=localhost;user id=root;password=root;database=website";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["login"] == null)
                Response.Redirect("index.aspx");

            if (Request.QueryString["id"] != null)
            {
                MySqlConnection mySqlConnection = new MySqlConnection(connectionString);
                mySqlConnection.Open();
                try
                {
                    String query = "SELECT * FROM website.products where id= " + Request.QueryString["id"] + ";";
                    Response.Write(query);
                    MySqlCommand cmd = new MySqlCommand(query, mySqlConnection);
                    MySqlDataReader reader = cmd.ExecuteReader();
                }
                catch (Exception Ex)
                {
                    Response.Write(Ex.Message.ToString());
                }
                finally
                {
                    mySqlConnection.Close();
                }
            }
        }
    }
}