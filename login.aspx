<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Project.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
     
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <link rel="stylesheet" href="login.css" />
</head>
<body class="bg">
      <form id="form1" runat="server">
        
            <div class="containerCard">
                <div class="row">
                    <h2>Login</h2>
                </div><br />

                <div class="row">
                </div>
                    <div class="row"> 
                        <h3>Email</h3>
                    </div>
                    <div class="row"> 
                <asp:TextBox ID="TextBox1" runat="server" cssclass="form-control" placeholder="Email"></asp:TextBox>
                    </div>

                <br /><div class="row"> 
                        <h3>Password</h3>
                    </div>
                    <div class="row">
                        <asp:TextBox ID="TextBox2" runat="server" cssclass="form-control" placeholder="Password"></asp:TextBox>
                    </div>
                <br /><br />
                <div class="row">
                    <asp:Button ID="Button1" runat="server" Text="Login" CssClass="btn btn-primary btn-block btn-lg" OnClick="Button1_Click"/>
                </div>

                <div class="row">
                    <div class="form-check align-content-center" >
                          <asp:CheckBox ID="showPassword" runat="server"  class="form-check-input" type="checkbox" />
                          <label class="form-check-label" for="showPassword">Show Password</label>
                        </div>
                </div>
                <div class="row">
                    <asp:Label ID="MessageBox" runat="server" Text=""></asp:Label>
                </div>
            </div>    
          
        </form> 
</body>
</html>
