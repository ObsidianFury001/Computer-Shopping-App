<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Project.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="style.css" />
</head>
<body>
    <div class="page">
        <form id="form1" runat="server">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg navbar-dark rounded-bottom sticky-top">
                <a class="navbar-brand nav-link nav-links" href="#">
                    <img id="Image1" src="images/logo.gif" width="40" height="40" class="rounded-2" alt="" />
                    Computer Sphere</a>
                <!-- Navbar toggler -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-lg-around" id="navbarNavAltMarkup">
                    <center>
                    <ul class="navbar-nav align-content-center">
                        <li class="nav-item">
                            <a class="nav-link nav-links active-link" href="index.aspx">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-links" href="index.aspx">About Us</a>
                        </li>
                    </ul>
                    </center>
                    <div class="mr-sm-2  w3-center">
                        <asp:Button ID="Button1" runat="server" Text="Sign Up" CssClass="btn linkButton" OnClick="Button1_Click"/>
                        <asp:Button ID="Button2" runat="server" Text="Sign In" CssClass="btn linkButton" OnClick="Button2_Click"/>
                        <asp:Button ID="Button3" runat="server" Text="Logout" CssClass="btn linkButton" OnClick="Button3_Click"/>
                        <asp:Button ID="Button4" runat="server" Text="Hello" CssClass="btn linkButton " /> 
                    </div>
                </div>
            </nav>
            <center><footer class="w3-panel w3-text-cyan footer">&copy All Rights Reserved</footer></center>
        </form>
    </div>
</body>
</html>
