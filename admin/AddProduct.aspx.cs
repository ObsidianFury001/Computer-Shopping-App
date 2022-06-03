using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.admin
{
	public partial class AddProduct : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Request.Cookies["admin"] == null)
				Response.Redirect("~/index.aspx");
		}

        protected void AddProductButton_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                FileUpload1.SaveAs("~/images/products/" + FileUpload1.FileName);
                Label1.Text = "File Uploaded: " + FileUpload1.FileName;
            }
            else
            {
                Label1.Text = "No File Uploaded.";
            }
        }
    }
}