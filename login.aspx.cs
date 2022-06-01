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
    public partial class login : System.Web.UI.Page
    {
        const String connectionString = "server=localhost;user id=root;password=root;database=website";
        //const String connectionString = "Data Source=GLACTUS;Initial Catalog=website;Integrated Security=True";

        HttpCookie authCookie;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["login"] != null)
                Response.Redirect("index.aspx");
        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            SignInUsingEmailAndPassword();
        }
        void SignInUsingEmailAndPassword()
        {
            MySqlConnection mySqlConnection = new MySqlConnection(connectionString);
            try
            {
                String email = TextBox1.Text.Trim();
                String password = TextBox2.Text.Trim();
                if (String.IsNullOrEmpty(email) &&
                    String.IsNullOrEmpty(password))
                    Response.Write("<script>alert('Please enter both email and password credentials.');</script>");
                else if (String.IsNullOrEmpty(email))
                    Response.Write("<script>alert('Please enter the email.');</script>");
                else if (String.IsNullOrEmpty(password))
                    Response.Write("<script>alert('Please enter the password.');</script>");
                else
                {
                    String query = "SELECT * FROM website.auth where email = \"" + email + "\" && password = \"" + password + "\";";
                    mySqlConnection.Open();
                    MySqlCommand cmd = new MySqlCommand(query, mySqlConnection);
                    MySqlDataReader reader = cmd.ExecuteReader();
                    //MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);

                    // Dataset Method
                    //DataSet dataSet = new DataSet();
                    //adapter.Fill(dataSet, "auth");

                    //if (dataSet.Tables["auth"].Rows.Count == 1)
                    if (reader.HasRows)
                    {
                        DateTime TimeNow = DateTime.Now;

                        //MessageBox.Text = "Sucessfully Signed In!!!";
                        while (reader.Read())
                        {
                            //Response.Write("<script>alert('Successfully Signed In!');</script>");

                            //Response.Write("<script>alert('" +
                            //    "Successfully Signed In! Welcome " +
                            //    reader.GetValue(1).ToString() + " " +
                            //    reader.GetValue(2).ToString() + "\\n" +
                            //    reader.GetValue(3).ToString() + "\\n" +
                            //    reader.GetValue(4).ToString() + "\\n" +
                            //    reader.GetValue(5).ToString() + "\\n" +
                            //    reader.GetValue(6).ToString() + "');</script>");

                            // Login state management
                            authCookie = new HttpCookie("login");
                            authCookie["id"] = reader.GetValue(0).ToString();
                            authCookie["first_name"] = reader.GetValue(1).ToString();
                            authCookie["last_name"] = reader.GetValue(2).ToString();
                            authCookie["username"] = reader.GetValue(3).ToString();
                            authCookie["email"] = reader.GetValue(4).ToString();
                            authCookie["pass"] = reader.GetValue(5).ToString();
                            authCookie["phone"] = reader.GetValue(6).ToString();
                            authCookie["role"] = reader.GetValue(7).ToString();

                            authCookie.Expires = DateTime.Now.AddDays(1d);
                            Response.Write(authCookie.ToString());
                            Response.Cookies.Add(authCookie);
                        }

                        Response.Redirect("index.aspx");
                        TextBox1.Text = "";
                        TextBox2.Text = "";
                    }
                    else
                        Response.Write("<script>alert('Invalid Credentials!!!');</script>");

                }
            }
            catch (Exception Ex)
            {
                Response.Write("<script>alert(Fatal Error Occured'" + Ex.Message + "');</script>");
            }
            finally
            {
                mySqlConnection.Close();
            }
        }

        protected void showPassword_CheckedChanged(object sender, EventArgs e)
        {
            if (showPassword.Checked)
                Response.Write("Checked");
            else
                TextBox2.TextMode = TextBoxMode.SingleLine; //For normal Plain text
        }
    }
}