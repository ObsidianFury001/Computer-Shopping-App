﻿<%@ Page Title="Login Page" MasterPageFile="~/Index.Master" Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Project.login" %>

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
    <div class="content">
        <div class="containerCard">
            <div class="form-row">
                <h2>Login</h2>
            </div><br />
            
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

            <div class="row">
                <div class="form-check" >
                        <asp:CheckBox ID="showPassword" runat="server" class="checkbox" type="checkbox" OnCheckedChanged="showPassword_CheckedChanged"/>
                        <label class="form-check-label" for="showPassword">Show Password</label>
                </div>
            </div>
            <center><h5 ><a href="signup.aspx" class="hint" >New User? Click here to Sign Up</a></h5></center>
        </div>
    </div>
</asp:Content>