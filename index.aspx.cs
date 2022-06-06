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
            if (!IsPostBack)
                GetData();
        }
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            var randomize = new Random();
            int i = randomize.Next(1, 16);
            Image2.ImageUrl = string.Concat("images/banners/", i.ToString(), ".jpg");
        }

        protected void searchFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            String filterQuery = "";
            String selectedCategory = searchFilter.SelectedItem.Text;
            if (searchFilter.SelectedIndex == 0)
                filterQuery = "SELECT * FROM website.products;";
            else
            {
                filterQuery = "SELECT * FROM products WHERE category = \"" + selectedCategory + "\";";

            }
            MySqlConnection mySqlConnection = new MySqlConnection(connectionString);
            mySqlConnection.Open();
            DataTable records = new DataTable();

            MySqlDataAdapter mySqlDataAdapter = new MySqlDataAdapter(filterQuery , mySqlConnection);
            mySqlDataAdapter.Fill(records);
            try
            {
                if (selectedCategory == records.Rows[0][2].ToString())
                    ;
            }
            catch(Exception Ex)
            {
                Response.Write("<script>alert('Product Category does not exist')");
            }

            ProductList.DataSource = records;
            ProductList.DataBind();

            //if (String.Equals(selectedCategory, "Product Category"))
                //filterQuery = "SELECT * FROM website.products;";
            mySqlConnection.Close();
        }
        private void GetData()
        {
            MySqlConnection mySqlConnection = new MySqlConnection(connectionString);
            mySqlConnection.Open();
            String query = "SELECT DISTINCT category FROM website.category;";
            String query2 = "SELECT * FROM website.products;";

            MySqlDataAdapter mySqlDataAdapter = new MySqlDataAdapter(query, mySqlConnection);
            DataTable filteredProducts = new DataTable();
            MySqlDataAdapter mySqlDataAdapter2 = new MySqlDataAdapter(query2, mySqlConnection);
            DataTable products = new DataTable();

            mySqlDataAdapter.Fill(filteredProducts);
            mySqlDataAdapter2.Fill(products);

            // Binding Search filter
            searchFilter.DataSource = filteredProducts;
            searchFilter.DataTextField = "Category";
            searchFilter.DataValueField = "category";
            searchFilter.DataBind();
            searchFilter.Items.Insert(0, "Product Category");

            // Binding Product Data List 
            ProductList.DataSource = products;
            ProductList.DataBind();
            mySqlConnection.Close();
        }
        
        protected void SearchButton_Click(object sender, EventArgs e)
        {
            String selectedCategory = SearchBox.Text;
            String filterQuery = "SELECT * FROM products WHERE (prod_name like \"%" + selectedCategory + "%\") OR (category like \"%" + selectedCategory + "%\");";
            //Response.Write("<script>alert('"+filterQuery+"')");
            MySqlConnection mySqlConnection = new MySqlConnection(connectionString);
            mySqlConnection.Open();
            DataTable records = new DataTable();

            MySqlDataAdapter mySqlDataAdapter = new MySqlDataAdapter(filterQuery, mySqlConnection);
            mySqlDataAdapter.Fill(records);
            try
            {
                if (selectedCategory == records.Rows[0][2].ToString())
                    ;
            }
            catch (Exception Ex)
            {
                Response.Write("<script>alert('Product Category does not exist')");
            }

            ProductList.DataSource = records;
            ProductList.DataBind();
            mySqlConnection.Close();
        }
        
        // Add to Cart
        protected void ProductList_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Session["addproduct"] = true;
            Response.Write(Session["addproduct"].ToString());

            if (e.CommandName == "AddToCart")
            {
                // Creating a Quantity object for the Quantity Dropdown List
                DropDownList quantityList = (DropDownList)(e.Item.FindControl("Quantity"));
                // Passing Product Id and Quantity as using Query String ?
                Response.Redirect("AddToCart.aspx?prod_id=" + e.CommandArgument.ToString() +
                    "&quantity=" + quantityList.SelectedItem.ToString());
            }
        }

        // Change add to cart button if product is out of stock
        protected void ProductList_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            Label ProductinCartID = (Label)e.Item.FindControl("ProductID");
            Label ProductinCartStock = (Label)e.Item.FindControl("Stock");
            Button CartButton = (Button)e.Item.FindControl("AddToCartButton");

            MySqlConnection mySqlConnection = new MySqlConnection(connectionString);
            mySqlConnection.Open();

            // Selecting product using ID
            String query = "SELECT * FROM products where id = " + ProductinCartID.Text + ";";
            MySqlDataAdapter mySqlDataAdapter = new MySqlDataAdapter(query, mySqlConnection);
            String availableStock = "";

            DataTable dt = new DataTable();
            mySqlDataAdapter.Fill(dt);

            // Accessing available stock field of selected product from database
            if (dt.Rows.Count > 0)
                availableStock = dt.Rows[0]["stock"].ToString();
            mySqlConnection.Close();

            if(Convert.ToInt32(availableStock) == 0)
            {
                ProductinCartStock.Text = "Out of Stock";
                CartButton.Enabled = false;

            }
            else // Set it to the availble stcok
            {
                ProductinCartStock.Text = availableStock;
            }
        }
    }
}