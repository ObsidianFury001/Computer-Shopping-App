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
        const string connectionString = "server=localhost;user id=root;password=root;database=website";
        MySqlConnection mySqlConnection = new MySqlConnection(connectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            cartFooter.Visible = false;
            MySqlConnection mySqlConnection = new MySqlConnection(connectionString);
            mySqlConnection.Open();
            if (Request.Cookies["login"] == null)
                Response.Redirect("index.aspx");
            BindCart(int.Parse(Request.Cookies["login"]["id"]));

            if (Request.QueryString["prod_id"] != null && Request.QueryString["quantity"] != null)
            {
                HttpCookie authCookie = Request.Cookies["login"];
                ClearCart.Enabled = true;
                OrderButton.Enabled = true;

                int product_id = int.Parse(Request.QueryString["prod_id"]);
                int quantity = int.Parse(Request.QueryString["quantity"]);
                int customer_id = int.Parse(authCookie["id"]);
                string email = authCookie["email"].ToString();
                string queryAddToCart = "";
                string querySelectProducts = "";
                string queryCartProducts = "";

                try
                {
                    //Response.Write(product_id.ToString() + quantity.ToString());
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
                            if(quantity > stock)
                            {
                                Response.Write("<script>alert('Stock Not available!!');</script>");
                            }
                            else
                            {
                                // Calculating total amount
                                int amount = cost * quantity;
                                // Cart Table Fields
                                // id, customer_id, email, prod_id, prod_name, category, cost, desc, image, stock, quantity, amount
                                // -------------------------------------------------
                                queryAddToCart = "INSERT INTO website.carts (customer_id, email, prod_id, prod_name, category, cost, image, stock, quantity, amount) VALUES ("
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

                                MySqlConnection mySqlConnection3 = new MySqlConnection(connectionString);
                                mySqlConnection3.Open();
                                //Response.Write("Inserting to Cart: " + queryAddToCart);
                                stock = stock - quantity;
                                string queryUpdate = "UPDATE website.products SET STOCK = " + stock.ToString() + " WHERE id = " + prod_id + ";";
                                MySqlCommand update = new MySqlCommand(queryUpdate, mySqlConnection3);
                                //Response.Write("<br>Update Query: "+queryUpdate+"<br>");
                                update.ExecuteNonQuery();
                            }
                        }
                        reader1.Close();
                    }
                    // Adding the selected product to the cartDetails table email and id as PK
                    MySqlCommand mySqlCommand2 = new MySqlCommand(queryAddToCart, mySqlConnection);
                    int val = mySqlCommand2.ExecuteNonQuery();
                    if (val == 1)
                    {
                        Response.Write("<script>alert('Added to Cart!!!');</script>");
                        Response.Redirect("index.aspx");
                    }
                    else
                        Response.Write("<script>alert('Error Occured!!!');</script>");


                    DataTable cartRecords = new DataTable();
                    queryCartProducts = "SELECT * FROM website.carts where customer_id = " + customer_id + ";";
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

        protected void BindCart(int customer_id)
        {
            MySqlConnection mySqlConnectionBind = new MySqlConnection(connectionString);
            mySqlConnectionBind.Open();
            DataTable cartRecords = new DataTable();
            string queryCartProducts = "SELECT * FROM website.carts where customer_id = " + customer_id + ";";
            MySqlDataAdapter mySqlDataAdapter = new MySqlDataAdapter(queryCartProducts, mySqlConnectionBind);
            mySqlDataAdapter.Fill(cartRecords);
            CartView.DataSource = cartRecords;
            CartView.DataBind();
            //Response.Write(queryCartNumberOfItems);
            int NumberOfcartItems = GetNumberOfcartItems(customer_id);
            int GrandTotal = 0;
            if (NumberOfcartItems > 0)
            {
                ClearCart.Enabled = true;
                OrderButton.Enabled = true;
                GrandTotal = 0;
                if (NumberOfcartItems == 1)
                {
                    GrandTotal = int.Parse(cartRecords.Rows[0]["amount"].ToString());
                    cartHeader.Text = "You have " + NumberOfcartItems + " item in your Shopping Cart.";
                }
                else if (NumberOfcartItems > 1)
                {
                    int i = 0;
                    while (i < NumberOfcartItems)
                    {
                        GrandTotal += int.Parse(cartRecords.Rows[0]["amount"].ToString());
                        i += 1;
                    }
                    cartHeader.Text = "You have " + NumberOfcartItems + " items in your Shopping Cart.";
                }

                cartFooter.Text = "Grand Total = " + GrandTotal + " AED";
                cartFooter.Visible = false;
            }
            else
            {
                ClearCart.Enabled = false;
                OrderButton.Enabled = false;
                cartHeader.Text = "You have no products in your shopping cart.";
                cartFooter.Text = "";
            }
            mySqlConnectionBind.Close();

        }
        protected int GetNumberOfcartItems(int customer_id)
        {
            MySqlConnection mySqlConnectionGet = new MySqlConnection(connectionString);
            mySqlConnectionGet.Open();
            string queryCartNumberOfItems ="SELECT COUNT(*) FROM website.carts where customer_id = " + customer_id + ";";
            MySqlCommand cmd2 = new MySqlCommand(queryCartNumberOfItems, mySqlConnectionGet);
            MySqlDataReader reader2 = cmd2.ExecuteReader();
            if (reader2.HasRows)
            {
                while (reader2.Read())
                {
                    return int.Parse(reader2.GetValue(0).ToString());
                }
                reader2.Close();
            }
            mySqlConnectionGet.Close();
            return 0;
        }

        protected void OrderButton_Click(object sender, EventArgs e)
        {
            cartFooter.Visible = true;
        }

        protected void CartView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            MySqlConnection mySqlConnection2 = new MySqlConnection(connectionString);
            mySqlConnection2.Open();

            // Update Stock on clear
            string queryCartNumberOfItems = "SELECT * FROM website.carts WHERE email = \"" + Request.Cookies["login"]["email"].ToString() + "\";";
            MySqlCommand cmd2 = new MySqlCommand(queryCartNumberOfItems, mySqlConnection2);
            MySqlDataReader reader2 = cmd2.ExecuteReader();
            if (reader2.HasRows)
            {
                MySqlConnection mySqlConnection3 = new MySqlConnection(connectionString);
                mySqlConnection3.Open();
                while (reader2.Read())
                {
                    int prod_id = int.Parse(reader2["id"].ToString());
                    int stock = int.Parse(reader2["stock"].ToString());
                    int quantity = int.Parse(reader2["quantity"].ToString());
                    stock = stock + quantity;
                    string queryUpdate = "UPDATE website.products SET STOCK = " + stock.ToString() + " WHERE id = " + prod_id + ";";
                    MySqlCommand update = new MySqlCommand(queryUpdate, mySqlConnection3);
                    //Response.Write("<br>Update Query: "+queryUpdate+"<br>");
                    update.ExecuteNonQuery();
                }
                mySqlConnection3.Close();
                reader2.Close();
            }
            mySqlConnection2.Close();
            int order_id = int.Parse(CartView.Rows[e.RowIndex].Cells[0].Text);
            //Response.Write(order_id.ToString());
            MySqlConnection mySqlConnection4 = new MySqlConnection(connectionString);
            mySqlConnection4.Open();
            string queryCartProducts = "DELETE FROM website.carts WHERE id = " + order_id + " and email = \""+ Request.Cookies["login"]["email"].ToString() + "\";";
            MySqlCommand deleteProduct = new MySqlCommand(queryCartProducts, mySqlConnection4);
            int val = deleteProduct.ExecuteNonQuery();
            //Response.Write("Value = "+ val + "Record with id = "+ order_id + " Deleted.");
            Response.Write(queryCartProducts);
            BindCart(int.Parse(Request.Cookies["login"]["id"]));
            mySqlConnection4.Close();
        }

        protected void ClearCart_Click(object sender, EventArgs e)
        {
            MySqlConnection mySqlConnection2 = new MySqlConnection(connectionString);
            mySqlConnection2.Open();

            // Update Stock on clear
            string queryCartNumberOfItems = "SELECT * FROM website.carts WHERE email = \"" + Request.Cookies["login"]["email"].ToString() + "\";";
            MySqlCommand cmd2 = new MySqlCommand(queryCartNumberOfItems, mySqlConnection2);
            MySqlDataReader reader2 = cmd2.ExecuteReader();
            if (reader2.HasRows)
            {
                MySqlConnection mySqlConnection3 = new MySqlConnection(connectionString);
                mySqlConnection3.Open();
                while (reader2.Read())
                {
                    int prod_id = int.Parse(reader2["id"].ToString());
                    int stock = int.Parse(reader2["stock"].ToString());
                    int quantity = int.Parse(reader2["quantity"].ToString());
                    stock = stock + quantity;
                    string queryUpdate = "UPDATE website.products SET STOCK = "+ stock.ToString() + " WHERE id = " + prod_id +";";
                    MySqlCommand update = new MySqlCommand(queryUpdate, mySqlConnection3);
                    //Response.Write("<br>Update Query: "+queryUpdate+"<br>");
                    update.ExecuteNonQuery();
                }
                mySqlConnection3.Close();
                reader2.Close();
            }
            string queryDelete = "DELETE FROM website.carts WHERE email = \"" + Request.Cookies["login"]["email"].ToString() + "\";";
            mySqlConnection2.Close();
            //Response.Write(query);

            MySqlConnection mySqlConnection4 = new MySqlConnection(connectionString);
            mySqlConnection4.Open();
            MySqlCommand delete = new MySqlCommand(queryDelete, mySqlConnection4);
            int val = delete.ExecuteNonQuery();
            mySqlConnection4.Close();
            //Response.Write("DELETE VALUE = "+ val.ToString());
            if (val == 1)
            {
                Response.Write("<script>alert('Cart Cleared!!!');</script>");
                Response.Redirect("index.aspx");
            }
            else
                Response.Write("<script>alert('Error Occured!!!');</script>");
        }
    }
}