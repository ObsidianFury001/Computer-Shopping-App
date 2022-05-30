<%@ Page Title="Sign Up Page" MasterPageFile="~/Index.Master"  Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="Project.signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />       
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="containerCard w3-responsive">
            <div class="form-row">
                <h2 style="font-weight:700;">Sign Up</h2>
            </div><br />

            <div class="form-row"> 
                <h4>First Name</h4>
            </div>
            <div class="form-row">
                <asp:TextBox ID="TextBox1" runat="server" cssclass="form-control" placeholder="First Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="TextBox1"
                    ErrorMessage="First Name is required field."
                    ForeColor="Red"
                    Font-Size="Smaller" ></asp:RequiredFieldValidator>
            </div>

            <div class="row"> 
                <h4>Last Name</h4>
            </div>
            <div class="form-row">
                <asp:TextBox ID="TextBox2" runat="server" cssclass="form-control" placeholder="Last Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="TextBox2"
                    ErrorMessage="Last Name is required field."
                    ForeColor="Red"
                    Font-Size="Smaller" ></asp:RequiredFieldValidator>
            </div>
                
            <div class="form-row">
                <h4>Username</h4>
            </div>
            <div class="form-row">
                <asp:TextBox ID="TextBox3" runat="server" cssclass="form-control" placeholder="Username"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                    ControlToValidate="TextBox3"
                    ErrorMessage="Username is required field."
                    ForeColor="Red"
                    Font-Size="Smaller" ></asp:RequiredFieldValidator>
            </div>
                
            <div class="form-row">
                <h4>Email</h4>
            </div>
            <div class="form-row">
                <asp:TextBox ID="TextBox4" runat="server" cssclass="form-control" placeholder="Email"></asp:TextBox>
                <asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server"
                    ControlToValidate="TextBox4"
                    ErrorMessage="Email is required field."
                    ForeColor="Red" 
                    Font-Size="Smaller" ></asp:RequiredFieldValidator>
            </div>
            
            <div class="form-row">
                <h4>Password</h4>
            </div>
            <div class="form-row">
                <asp:TextBox ID="TextBox5" runat="server" cssclass="form-control" placeholder="Password"></asp:TextBox>
                <asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server"
                    ControlToValidate="TextBox5"
                    ErrorMessage="Password is required field."
                    ForeColor="Red" 
                    Font-Size="Smaller" ></asp:RequiredFieldValidator>
            </div>
            
            <div class="form-row">
                <h4>Phone</h4>
            </div>
            <div class="form-row">
                <asp:TextBox ID="TextBox6" runat="server" cssclass="form-control" placeholder="Phone"></asp:TextBox>
                <asp:RequiredFieldValidator id="RequiredFieldValidator6" runat="server"
                    ControlToValidate="TextBox6"
                    ErrorMessage="Phone is required field."
                    ForeColor="Red" 
                    Font-Size="Smaller" ></asp:RequiredFieldValidator>
            </div>
            
            <div class="row w3-margin"> 
                <asp:Button ID="sizzgnUp" runat="server" Text="Sign Up" CssClass="btn primary btn-block btn-lg" OnClick="signUp_Click"/>
            </div>
            
            <center><h5><a href="signup.aspx" class="hint" >Already Signed Up? Click here to Sign In</a></h5></center>
        </div>
</asp:Content>
