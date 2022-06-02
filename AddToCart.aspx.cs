using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
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
            MySqlConnection mySqlConnection = new MySqlConnection(connectionString);
            mySqlConnection.Open();
            if (Request.Cookies["login"] == null)
                Response.Redirect("index.aspx");
            BindCart(int.Parse(Request.Cookies["login"]["id"]), mySqlConnection);

            if (Request.QueryString["prod_id"] != null && Request.QueryString["quantity"] != null)
            {
                HttpCookie authCookie = new HttpCookie("login");
                authCookie = Request.Cookies["login"];

                int product_id = int.Parse(Request.QueryString["prod_id"]);
                int quantity = int.Parse(Request.QueryString["quantity"]);
                int customer_id = int.Parse(authCookie["id"]);
                string email = authCookie["email"].ToString();
                string queryAddToCart = "";
                string querySelectProducts = "";
                string queryCartProducts = "";

                try
                {
                    Response.Write(product_id.ToString() + quantity.ToString());
                    querySelectProducts = "SELECT * FROM website.products where id= " 
                        + product_id + ";";
                    //Response.Write(querySelectProducts);
                    MySqlCommand cmd1 = new MySqlCommand(querySelectProducts, mySqlConnection);
                    MySqlDataReader reader1 = cmd1.ExecuteReader();

                    // Retrieving the product the user wants to add to the cart
                    if (reader1.HasRows)
                    {
                        while (reader1.Read())
                        {
                            // Product Table Fields
                            // id, prod_name, category, desc, image, stock, cost
                            // -------------------------------------------------
                            int prod_id = int.Parse(reader1.GetValue(0).ToString());
                            string prod_name = reader1.GetValue(1).ToString();
                            string category = reader1.GetValue(2).ToString();
                            string desc = reader1.GetValue(3).ToString();
                            string image = reader1.GetValue(4).ToString();
                            int stock = int.Parse(reader1.GetValue(5).ToString());
                            int cost = int.Parse(reader1.GetValue(6).ToString());
                            //Response.Write("Product Values for product ID" + "," + prod_id + "," + prod_name + category + "," + desc + "," + image + "," + stock + "," + cost);

                            // Calculating total amount
                            int amount = stock * cost;
                            // Cart Table Fields
                            // id, customer_id, email, prod_id, prod_name, category, cost, desc, image, stock, quantity, amount
                            // -------------------------------------------------
                            queryAddToCart = "INSERT INTO website.carts (customer_id, email, prod_id, prod_name, category, cost, desc, image, stock, quantity, amount) VALUES ("
                                + customer_id + ",\""
                                + email + "\","
                                + prod_id + ",\""
                                + prod_name + "\",\""
                                + category + "\"," 
                                + cost + ",\"" 
                                //+ desc + "\",\"" 
                                + image + "\"," 
                                + stock + "," 
                                + quantity + "," 
                                + amount + ");";
                            Response.Write("Inserting to Cart: " + queryAddToCart);
                        }
                        reader1.Close();
                    }
                    // Adding the selected product to the cartDetails table email and id as PK
                    MySqlCommand mySqlCommand2 = new MySqlCommand(queryAddToCart, mySqlConnection);
                    int val = mySqlCommand2.ExecuteNonQuery();
                    if (val == 1)
                    {
                        Response.Write("<script>alert('Added to Cart!!!');</script>");
                    }
                    else
                        Response.Write("<script>alert('Error Occured!!!');</script>");


                    DataTable cartRecords = new DataTable();
                    queryCartProducts = "SELECT * FROM website.carts where customer_id = " + customer_id+";";
                    MySqlDataAdapter mySqlDataAdapter = new MySqlDataAdapter(queryCartProducts, mySqlConnection);
                    mySqlDataAdapter.Fill(cartRecords);
                    CartView.DataSource = cartRecords;
                    CartView.DataBind();
                    mySqlConnection.Close();
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

        protected void BindCart(int customer_id, MySqlConnection mySqlConnection)
        {

            DataTable cartRecords = new DataTable();
            string queryCartProducts = "SELECT * FROM website.carts where customer_id = " + customer_id + ";";
            MySqlDataAdapter mySqlDataAdapter = new MySqlDataAdapter(queryCartProducts, mySqlConnection);
            mySqlDataAdapter.Fill(cartRecords);
            CartView.DataSource = cartRecords;
            CartView.DataBind();
            string queryCartNumberOfItems = "SELECT COUNT(*) FROM website.carts;";

            DataTable CartItemsTable = new DataTable();
            MySqlDataAdapter mySqlDataAdapter2 = new MySqlDataAdapter(queryCartNumberOfItems, mySqlConnection);
            mySqlDataAdapter.Fill(CartItemsTable);
            CartItems = int.Parse(CartItemsTable);

            if (CartView.Rows.Count > 0)
            {
                OrderButton.Enabled = true;
                cartHeader.Text = "You have " + cartItems + " in your Shopping Cart.";
            }
            else
            {
                OrderButton.Enabled = false;
                cartHeader.Text = "You have no products in your shopping cart.";
            }

        }
    }
}