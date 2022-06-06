using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.admin
{
    public partial class AddProduct : System.Web.UI.Page
    {
        const String connectionString = "server=localhost;user id=root;password=root;database=website";
        //const String connectionString = "Data Source=GLACTUS;Initial Catalog=website;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["login"] != null)
                Response.Redirect("../index.aspx");
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
        protected void AddNewProduct()
        {
            MySqlConnection mySqlConnection = new MySqlConnection(connectionString);
            try
            {
                String query = "INSERT INTO website.products(prod_name, category, description, image, stock, cost) VALUES('"
                       + TextBox1.Text.Trim() + "','"
                       + TextBox2.Text.ToUpper().Trim() + "','"
                       + TextBox3.Text + "','"
                       + "~/images/products/" + FileUpload1.FileName.ToString() + "',"
                       + TextBox4.Text.Trim() + ","
                       + TextBox5.Text.Trim() + ");";

                mySqlConnection.Open();
                MySqlCommand mySqlCommand = new MySqlCommand(query, mySqlConnection);

                //Response.Write(query);
                int val = mySqlCommand.ExecuteNonQuery();
                if (val == 1)
                {
                    string fileName = Path.Combine(Server.MapPath("~/images/products"), FileUpload1.FileName);
                    ClientScript
                        .RegisterClientScriptBlock(
                            this.GetType(),
                            "k",
                            "swal('Action Completed!', 'Successfully added your product.', 'success')",
                            true);
                    FileUpload1.SaveAs(fileName);
                    Response.AddHeader("REFRESH", "3;URL='AddProduct.aspx'");
                }
                else
                    ClientScript
                        .RegisterClientScriptBlock(
                            this.GetType(),
                            "k",
                            "swal('Error Occurred!', 'Something went wrong...', 'warning')",
                            true);

                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                mySqlConnection.Close();
            }
            catch (Exception Ex)
            {
                ClientScript
                    .RegisterClientScriptBlock(
                        this.GetType(),
                        "k",
                        "swal('Fatal Error!', 'Something went wrong...', 'error')",
                        true);
            }
            finally
            {
                mySqlConnection.Close();
            }
        }
    }
}