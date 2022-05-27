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
#pragma warning disable IDE1006 // Naming Styles
    public partial class login : System.Web.UI.Page
#pragma warning restore IDE1006 // Naming Styles
    {
        const String connectionString = "server=localhost;user id=root;password=root;database=website";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MySqlConnection mySqlConnection = new MySqlConnection(connectionString);
            try
            {
                String email = TextBox1.Text.Trim();
                String password = TextBox2.Text.Trim();

                if (String.IsNullOrEmpty(email) &&
                    String.IsNullOrEmpty(password))
                    MessageBox.Text = "Please enter both email and password credentials.";

                if (String.IsNullOrEmpty(email))
                    MessageBox.Text = "Please enter the email.";

                if (String.IsNullOrEmpty(password))
                    MessageBox.Text = "Please enter the password.";
                else
                {
                    String query = "SELECT * FROM website.auth where email = \"" + email + "\" && password = \"" + password + "\";";
                    MySqlCommand cmd = new MySqlCommand(query, mySqlConnection);
                    MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
                    DataSet dataSet = new DataSet();
                    adapter.Fill(dataSet);

                    if (dataSet.Tables[0].Rows.Count == 1)
                    {
                        DateTime TimeNow = DateTime.Now; ;
                        MessageBox.Text = "Sucessfully Signed In!!!";

                        TextBox1.Text = "";
                        TextBox2.Text = "";
                    }
                    else 
                        MessageBox.Text = "Error Occured!!!";

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