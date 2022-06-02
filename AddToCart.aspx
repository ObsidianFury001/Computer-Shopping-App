﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="AddToCart.aspx.cs" Inherits="Project.AddToCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
    <!-- Bootstrap Libraries -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    <!-- W3 Libraries -->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-ios.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

    <!-- Javascript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <link rel="stylesheet" href="style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-cart"><br />   
        <center>
            <div class="card">
                <div class="row">
                    <div class="col"><h1 class="display-5">Your Cart</h1></div>
                </div>
                <div class="row">
                    <div class="col">
                          <asp:Button ID="Continue" runat="server" 
                            CssClass="btn btn-dark w3-margin linkButton continue-shopping"
                            Text="Continue Shopping"/>
                        <asp:Button ID="ClearCart" runat="server" 
                            CssClass="btn btn-dark w3-margin linkButton continue-shopping"
                    Text="ClearCart" />
                    </div>
                </div>
            </div> 
        </center><br />
    </div>
</asp:Content>
