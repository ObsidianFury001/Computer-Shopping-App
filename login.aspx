<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Project.login" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="style.css" />
</head>
<body>
    <div>
    <form id="form1" runat="server"> 
        <!-- Navbar -->
            <nav class="navbar navbar-expand-lg navbar-dark rounded-bottom sticky-top">
                <a class="navbar-brand align-items-center" href="#">
                    <img id="Image1" src="images/logo.gif" width="40" height="40" class="rounded-2" alt="" />
                    Computer Sphere</a>
                <!-- Navbar toggler -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-md-around" id="navbarNavAltMarkup">
                     <ul class="navbar-nav justify-content-evenly">
                        <li class="nav-item">
                            <a class="nav-link nav-links" href="index.aspx">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-links" href="index.aspx">About Us</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-links" href="index.aspx">Home</a>
                        </li>
                    </ul>
                    <div class="mr-sm-2">
                        <asp:Button ID="Button1" runat="server" Text="Sign Up" CssClass="btn linkButton" OnClick="Button1_Click"/>
                        <asp:Button ID="Button2" runat="server" Text="Sign In" CssClass="btn linkButton active-link-button" OnClick="Button2_Click"/>
                        <asp:Button ID="Button3" runat="server" Text="Logout" CssClass="btn linkButton" OnClick="Button3_Click"/>
                        <asp:Button ID="Button4" runat="server" Text="Hello" CssClass="btn linkButton " /> 
                    </div>
                </div>
            </nav>
        <div class="containerCard">
            <div class="row">
                <h2>Login</h2>
            </div><br />

            <div class="row">
                <h4>Email</h4>
            </div>

            <div class="row"> 
                <asp:TextBox ID="TextBox1" runat="server" cssclass="form-control" placeholder="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="TextBox1"
                    ErrorMessage="Username is required."
                    ForeColor="Red" ></asp:RequiredFieldValidator>
            </div>

            <div class="row">
                <h4>Password</h4>
            </div>
            <div class="row">
                <asp:TextBox ID="TextBox2" runat="server" cssclass="input-group" placeholder="Password" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="TextBox2"
                    ErrorMessage="Password is required."
                    ForeColor="Red" ></asp:RequiredFieldValidator>
            </div>

            <div class="row">
                <asp:Button ID="loginButton" runat="server" Text="Login" CssClass="btn primary btn-block btn-lg" OnClick="loginButton_Click"/>
            </div>

            <div class="row">
                <div class="form-check" >
                        <asp:CheckBox ID="showPassword" runat="server" class="checkbox" type="checkbox"/>
                        <label class="form-check-label" for="showPassword">Show Password</label>
                </div>
            </div>
            <center><h5 class="hint" ><a href="signup.aspx">New User? Click here to Sign Up</a></h5></center>
        </div>    
    </form> 
        <center><footer class="w3-panel w3-text-cyan footer">&copy All Rights Reserved</footer></center>
    </div>
</body>
</html>
