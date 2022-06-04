<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminCommands.aspx.cs" Inherits="Project.admin.AdminCommands" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
</head>
<body>
    <form id="form1" runat="server">
         <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark rounded-bottom sticky-top" 
            style="width: clamp(10%, 100%, 101%);">
            <center><div>
            <a class="navbar-brand align-items-center" href="AdminHome.aspx"  
                style="font-weight: 600;
                font-size: 22px;" >
                <img id="Image1" src="../images/logo.gif" width="60" height="40" class="rounded-2" alt="" />
                Computer Sphere</a>
                <!-- Navbar toggler -->
                <button class="navbar-toggler w3-right" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
                </button></div>
            </center>
            <div class="collapse navbar-collapse justify-content-lg-around" id="navbarNavAltMarkup">
                <center>    
                    <ul class="navbar-nav justify-content-evenly align-items-center w3-padding">
                    <li class="nav-item">
                        <a id="link1" class="nav-link nav-links2" href="AdminCommands.aspx">Add Product</a>
                    </li>
                    <li class="nav-item">
                        <a id="link2" class="nav-link nav-links2" href="#">Update Product</a>
                    </li>
                    <li class="nav-item">
                        <a id="link4" class="nav-link nav-links2" href="#">Delete Product</a>
                    </li>
                </ul>
                </center>
            </div>
        </nav>
     
    </form>
</body>
</html>
