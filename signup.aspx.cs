using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace Project
{
    public partial class signup : System.Web.UI.Page
    {
        const String connectionString = "server=localhost;user id=root;password=root;database=website";
        //const String connectionString = "Data Source=GLACTUS;Initial Catalog=website;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["login"] != null)
                Response.Redirect("index.aspx");
        }

        protected void signUp_Click(object sender, EventArgs e)
        {
            CreateNewUser();
        }
        void CreateNewUser()
        {
            MySqlConnection mySqlConnection = new MySqlConnection(connectionString);
            try
            {
                if (
                      TextBox1.Text == "" ||
                      TextBox2.Text == "" ||
                      TextBox3.Text == "" ||
                      TextBox4.Text == "" ||
                      TextBox5.Text == "" ||
                      TextBox6.Text == "")

                    Response.Write("<script>alert('Please enter all details...');</script>");

                else
                {
                    String query = "INSERT INTO website.auth(first_name, last_name, username, email, password, phone) VALUES(\""
                        + TextBox1.Text.Trim() + "\",\""
                        + TextBox2.Text.Trim() + "\",\""
                        + TextBox3.Text.Trim() + "\",\""
                        + TextBox4.Text.Trim() + "\",\""
                        + TextBox5.Text.Trim() + "\",\""
                        + TextBox6.Text.Trim() + "\");";

                    mySqlConnection.Open();
                    //Response.Write(query);
                    MySqlCommand mySqlCommand = new MySqlCommand(query, mySqlConnection);
                    int val = mySqlCommand.ExecuteNonQuery();

                    if (val == 1)
                    {
                        Response.Write("<script>alert('Sucessfully Signed Up!!!');</script>");
                        Response.Redirect("login.aspx");
                    }
                    else
                        Response.Write("<script>alert('Error Occured!!!');</script>");

                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                    TextBox4.Text = "";
                    TextBox5.Text = "";
                }
            }
            catch (Exception Ex)
            {
                Response.Write("<script>alert('Fatal Error Occured...'" + Ex.Message + "');</script>");
            }
            finally
            {
                mySqlConnection.Close();
            }
        }
    }
}
