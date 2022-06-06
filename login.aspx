<%@ Page Title="Login Page" MasterPageFile="~/Index.Master" Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Project.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Bootstrap Libraries -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

    <!-- W3 Libraries -->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-ios.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

    <!-- Sweet Alerts -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <!-- Javascript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <link rel="stylesheet" href="style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <center><br />
            <div class="containerCard">
            <div class="form-row">
                <h2 style="font-weight:700;">Login</h2>
            </div>
            
            <hr class="hr-purple" /><br />
            <div class="form-row">
                <h4>Email</h4>
            </div>
            
            <div class="form-row">
                <asp:TextBox ID="TextBox1" runat="server" cssclass="form-control" placeholder="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="TextBox1"
                    ErrorMessage="Username is required."
                    ForeColor="Red" ></asp:RequiredFieldValidator>
            </div>
            
            <div class="form-row">
                <h4>Password</h4>
            </div>
            <div class="form-row">
                <asp:TextBox ID="TextBox2" runat="server" cssclass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="TextBox2"
                    ErrorMessage="Password is required."
                    ForeColor="Red" ></asp:RequiredFieldValidator>
            </div>
            
            <div class="row w3-margin"> 
                <asp:Button ID="loginButton" runat="server" Text="Login" CssClass="btn primary btn-block btn-lg" OnClick="loginButton_Click"/>
            </div>
            
<%--            <div class="row">
                <div class="form-check" >
                        <asp:CheckBox ID="showPassword" runat="server" class="checkbox" type="checkbox" />
                        <label class="form-check-label" for="showPassword">Show Password</label>
                </div>
            </div>--%>
            <center><h5 ><a href="signup.aspx" class="hint" >New User? Click here to Sign Up</a><asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                </h5></center>
        </div></center><br />
    </div>
</asp:Content>
