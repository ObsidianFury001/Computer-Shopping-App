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
                Button3.Visible = true;
                Button4.Visible = true;
                Button4.Text = "Hello " + Request.Cookies["admin"]["username"];
            }
            else if(Response.Cookies["login"] != null)
            {
                HttpCookie authcookie = new HttpCookie("login");
                authcookie.Expires = DateTime.Now.AddDays(-1d);
                Response.Cookies.Add(authcookie);
                Page.ClientScript
                   .RegisterClientScriptBlock(
                       this.GetType(),
                       "k",
                       "swal('Unauthorized Access!', 'Admins only...', 'danger')",
                       true);
                Response.AddHeader("REFRESH", "3;URL='../index.aspx'");
            }
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            HttpCookie authcookie = new HttpCookie("admin");
            authcookie.Expires = DateTime.Now.AddDays(-1d);
            Response.Cookies.Add(authcookie);
            Page.ClientScript
               .RegisterClientScriptBlock(
                   this.GetType(),
                   "k",
                   "swal('Success!', 'Signed out from admin module.', 'success')",
                   true);

            Response.AddHeader("REFRESH", "3;URL='../index.aspx'");
            Session.Abandon();
        }
    }
}