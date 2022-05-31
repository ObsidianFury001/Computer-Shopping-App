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
                Button1.Visible = false;
                Button2.Visible = false;
                Button3.Visible = true;
                Button4.Visible = true;
                Button5.Visible = false;
                Button4.Text = "Hello " + Request.Cookies["admin"]["username"];
            }
            else
            {
                Button1.Visible = true;
                Button2.Visible = true;
                Button3.Visible = false;
                Button4.Visible = false;
                Button5.Visible = true;
                Response.Redirect("~/index.aspx");
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/signup.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/login.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            HttpCookie authcookie = new HttpCookie("admin");
            authcookie.Expires = DateTime.Now.AddDays(-1d);
            Response.Cookies.Add(authcookie);
            Response.Redirect("~/index.aspx");
        }
        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Adminlogin.aspx");
        }
    }
}