using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.admin
{
    public partial class UpdateProduct1 : System.Web.UI.Page
    {
        const String connectionString = "server=localhost;user id=root;password=root;database=website";
        //const String connectionString = "Data Source=GLACTUS;Initial Catalog=website;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["login"] != null)
                Response.Redirect("index.aspx"); 
            GetData();
        }
        protected void AdminCommandsButton_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(TextBox1.Text.Trim()) ||
                String.IsNullOrEmpty(TextBox2.Text.Trim()) ||
                String.IsNullOrEmpty(TextBox3.Text.Trim()) ||
                String.IsNullOrEmpty(TextBox4.Text.Trim()) ||
                String.IsNullOrEmpty(TextBox5.Text.Trim()) ||
                       !FileUpload1.HasFile)
                ClientScript
                    .RegisterClientScriptBlock(
                        this.GetType(),
                        "k",
                        "swal('Error!', 'Please enter all the product details.', 'warning')",
                        true);
            else
                AddNewProduct();
        }
        private void GetData()
        {
            MySqlConnection mySqlConnection = new MySqlConnection(connectionString);
            mySqlConnection.Open();
            string query = "SELECT id FROM website.products;";

            MySqlDataAdapter mySqlDataAdapter = new MySqlDataAdapter(query, mySqlConnection);
            DataTable products = new DataTable();
            mySqlDataAdapter.Fill(products);

            // Binding Product Id Selector
            ProductIdSelector.DataSource = products;
            ProductIdSelector.DataTextField = "id";
            ProductIdSelector.DataValueField = "id";
            ProductIdSelector.DataBind();
            mySqlConnection.Close();
        }
        protected void AddNewProduct()
        {
            MySqlConnection mySqlConnection = new MySqlConnection(connectionString);
            try
            {
                string query = "Update website.products SET " +
                    "prod_name = \'" + TextBox1.Text.Trim()
                    + "\', category = \'" + TextBox2.Text.ToUpper().Trim() 
                    + "\', description = \'" + TextBox3.Text
                    + "\', image = \'" + "images/products/" + FileUpload1.FileName.ToString()
                    + "\', stock = " + TextBox4.Text 
                    + ", cost = " + TextBox5.Text.Trim() + " where id = "
                    + ProductIdSelector.SelectedValue.ToString() + ";";
                //Response.Write(query);

                mySqlConnection.Open();
                MySqlCommand mySqlCommand = new MySqlCommand(query, mySqlConnection);
                int val = mySqlCommand.ExecuteNonQuery();
                Response.Write("Update command Val = " + val);
                if (val == 1)
                {
                    string fileName = Path.Combine(Server.MapPath("/images/products"), FileUpload1.FileName);
                    FileUpload1.SaveAs(fileName);
                    ClientScript
                        .RegisterClientScriptBlock(
                            this.GetType(),
                            "k",
                            "swal('Action Completed!', 'Successfully updated your product.', 'success')",
                            true);
                }
                else
                    ClientScript
                        .RegisterClientScriptBlock(
                            this.GetType(),
                            "k",
                            "swal('Error Occurred!', 'Something went wrong...', 'warning')",
                            true);
            }
            catch (Exception Ex)
            {
                ClientScript
                    .RegisterClientScriptBlock(
                        this.GetType(),
                        "k",
                        "swal('Fatal Error!', Ex.message.t'Something went wrong...', 'error')",
                        true);
            }
            finally
            {
                mySqlConnection.Close();
            }
        }
    }
}