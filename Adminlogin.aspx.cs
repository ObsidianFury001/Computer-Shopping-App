using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.admin
{
    public partial class Adminlogin : System.Web.UI.Page
    {
        const String connectionString = "server=localhost;user id=root;password=root;database=website";
        //const String connectionString = "Data Source=GLACTUS;Initial Catalog=website;Integrated Security=True";
        HttpCookie adminCookie;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["admin"] != null)
                Response.Redirect("~/admin/AdminAddProduct.aspx");
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
                    Response.Write("<script>alert('Please enter both username and password credentials.');</script>");
                else if (String.IsNullOrEmpty(email))
                    Response.Write("<script>alert('Please enter the username.');</script>");
                else if (String.IsNullOrEmpty(password))
                    Response.Write("<script>alert('Please enter the password.');</script>");
                else
                {
                    String query = "SELECT * FROM website.admin where username = \"" + email + "\" && password = \"" + password + "\";";
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
                            Response.Write("<script>alert('Successfully Signed In!');</script>");

                            //Response.Write("<script>alert('" +
                            //    "Successfully Signed In! Welcome " +
                            //    reader.GetValue(1).ToString() + " " +
                            //    reader.GetValue(2).ToString() + "\\n" +
                            //    reader.GetValue(3).ToString() + "\\n" +
                            //    reader.GetValue(4).ToString() + "\\n" +
                            //    reader.GetValue(5).ToString() + "\\n" +
                            //    reader.GetValue(6).ToString() + "');</script>");

                            // Login state management
                            adminCookie = new HttpCookie("admin");
                            adminCookie["id"] = reader.GetValue(0).ToString();
                            adminCookie["username"] = reader.GetValue(1).ToString();
                            adminCookie["password"] = reader.GetValue(2).ToString();
                            adminCookie["role"] = reader.GetValue(3).ToString();

                            adminCookie.Expires = DateTime.Now.AddDays(1d);
                            Response.Cookies.Add(adminCookie);
                        }

                        Response.Redirect("admin/AdminAddProduct.aspx");
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
            {
                TextBox2.TextMode = TextBoxMode.SingleLine;
                var value = TextBox2.TextMode.ToString();
                Response.Write("<script>Console.Write(value);</script>");
            }
                
        }
    }
}