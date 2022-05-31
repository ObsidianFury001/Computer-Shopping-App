using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Data.Sql;


namespace Project
{
    public partial class index : System.Web.UI.Page
    {
        string connectionString = "server=localhost;user id=root;password=root;database=website";
        protected void Page_Load(object sender, EventArgs e)
        {
            var randomize = new Random();
            int i = randomize.Next(1,16);
            Image2.ImageUrl = string.Concat("images/banners/", i.ToString(), ".jpg");

            GetData();
        }
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            var randomize = new Random();
            int i = randomize.Next(1, 100)%16;
            Image2.ImageUrl = string.Concat("images/banners/", i.ToString(), ".jpg");
        }

        protected void searchFilter_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        private void GetData()
        {

            MySqlConnection mySqlConnection = new MySqlConnection(connectionString);
            mySqlConnection.Open();
            String query = "SELECT * FROM website.products;";
            MySqlDataAdapter mySqlDataAdapter = new MySqlDataAdapter(query, mySqlConnection);
            DataTable dt = new DataTable();

            mySqlDataAdapter.Fill(dt);
            // Binding Search filter
            searchFilter.DataSource = dt;
            searchFilter.DataTextField = "Category";
            searchFilter.DataValueField = "category";
            searchFilter.DataBind();

            // Binding Product Data List 
            ProductList.DataSource = dt;
            ProductList.DataBind();
            mySqlConnection.Close();
        }
    }
}