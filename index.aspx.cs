﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            var randomize = new Random();
            int i = randomize.Next(1, 100)%16;
            Image2.ImageUrl = string.Concat("banners/", i.ToString(), ".jpg");
        }
    }
}