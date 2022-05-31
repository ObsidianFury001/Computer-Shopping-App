using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["admin"] != null)
            {
                Button1.Visible = true;
                Button2.Visible = true;
                Button2.Text = "Hello " + Request.Cookies["admin"]["username"];
            }
            else
            {
                Button1.Visible = false;
                Button2.Visible = false;
                Response.Redirect("Adminlogin.aspx");
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            HttpCookie authcookie = new HttpCookie("admin");
            authcookie.Expires = DateTime.Now.AddDays(-1d);
            Response.Cookies.Add(authcookie);
            Response.Redirect("index.aspx");
        }
    }
}