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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
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
                    MessageBox.Text = "Please enter all details...";
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
                    Response.Write(query);
                    MySqlCommand mySqlCommand = new MySqlCommand(query, mySqlConnection);
                    int val = mySqlCommand.ExecuteNonQuery();

                    if (val == 1)
                        MessageBox.Text = "Sucessfully Signed Up!!!";
                    else
                        MessageBox.Text = "Error Occured!!!";

                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                    TextBox4.Text = "";
                    TextBox5.Text = "";
                }
            }
            catch
            {
                MessageBox.Text = "Fatal Error Occured...";
            }
            finally
            {
                mySqlConnection.Close();
            }
        }

    }
}
