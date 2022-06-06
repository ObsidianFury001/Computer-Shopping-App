using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.admin
{
    public partial class DeleteProduct : System.Web.UI.Page
    {
        const string connectionString = "server=localhost;user id=root;password=root;database=website";
        protected void Page_Load(object sender, EventArgs e)
        {
            cartFooter.Visible = false; 
            BindCart();
        }


        protected void BindCart()
        {
            MySqlConnection mySqlConnectionBind = new MySqlConnection(connectionString);
            mySqlConnectionBind.Open();
            DataTable cartRecords = new DataTable();
            string queryCartProducts = "SELECT * FROM website.products;";
            MySqlDataAdapter mySqlDataAdapter = new MySqlDataAdapter(queryCartProducts, mySqlConnectionBind);
            mySqlDataAdapter.Fill(cartRecords);
            CartView.DataSource = cartRecords;
            CartView.DataBind();
            //Response.Write(queryCartNumberOfItems
            if (cartRecords.Rows.Count >= 1)
            {
                ClearCart.Enabled = true;
                cartHeader.Text = "Total number of products: " + cartRecords.Rows.Count;
            }
            else
            {
                ClearCart.Enabled = false;
                cartHeader.Text = "There are no products";
            }
            mySqlConnectionBind.Close();

        }
        protected void CartView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            MySqlConnection mySqlConnection4 = new MySqlConnection(connectionString);
            mySqlConnection4.Open();
            int index = Convert.ToInt32(e.RowIndex);
            string queryCartProducts = "DELETE FROM website.products WHERE id = " + CartView.Rows[index].Cells[0].Text;
            MySqlCommand deleteProduct = new MySqlCommand(queryCartProducts, mySqlConnection4);
            int val = deleteProduct.ExecuteNonQuery();
            if(val == 1)
            {
                Page.ClientScript
                   .RegisterClientScriptBlock(
                       this.GetType(),
                       "k",
                       "swal('Success!', 'Product deleted.', 'success')",
                       true);

                Response.AddHeader("REFRESH", "1;URL='DeleteProduct.aspx");
            }
            mySqlConnection4.Close();
        }

        protected void ClearCart_Click(object sender, EventArgs e)
        {
            string queryDelete = "DELETE * FROM website.products";
            //Response.Write(query);
            try
            {
                MySqlConnection mySqlConnection4 = new MySqlConnection(connectionString);
                mySqlConnection4.Open();
                MySqlCommand delete = new MySqlCommand(queryDelete, mySqlConnection4);
                int val = delete.ExecuteNonQuery();
                mySqlConnection4.Close();
                //Response.Write("DELETE VALUE = "+ val.ToString());
                if (val == 1)
                {
                    ClientScript
                       .RegisterClientScriptBlock(
                           this.GetType(),
                           "k",
                           "swal('Success!', 'All Products deleted.', 'success')",
                           true);
                    Response.AddHeader("REFRESH", "1;URL='DeleteProduct.aspx");
                }
                else
                {
                    ClientScript
                       .RegisterClientScriptBlock(
                           this.GetType(),
                           "k",
                           "swal('Error!','Error in clearing all products.', 'error')",
                           true);
                    //Response.AddHeader("REFRESH", "3;URL='AddToCart.aspx'");
                }
            }
            catch (Exception Ex)
            {
                ClientScript
                   .RegisterClientScriptBlock(
                       this.GetType(),
                       "k",
                       "swal('Error!','Fatal error occurred.'+ Ex.Message.ToString(), 'error')",
                       true);
            }
        }
    }
}