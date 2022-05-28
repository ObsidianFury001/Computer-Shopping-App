<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="Project.signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />       
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <link rel="stylesheet" href="style.css" />
</head>
<body>
    <form id="form1" runat="server"><br />
        <div class="containerCard w3-responsive">
            <div class="row">
                    <h2>Sign Up</h2>
            </div><br />

            <div class="row"> 
                <h4>First Name</h4>
            </div>
            <div class="row"> 
                <asp:TextBox ID="TextBox1" runat="server" cssclass="form-control" placeholder="First Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="TextBox1"
                    ErrorMessage="First Name is required field."
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
            </div>

            <div class="row"> 
                <h4>Last Name</h4>
            </div>
            <div class="row"> 
                <asp:TextBox ID="TextBox2" runat="server" cssclass="form-control" placeholder="Last Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="TextBox2"
                    ErrorMessage="Last Name is required field."
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
            </div>
                
            <div class="row"> 
                <h4>Username</h4>
            </div>
            <div class="row"> 
                <asp:TextBox ID="TextBox3" runat="server" cssclass="form-control" placeholder="Username"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                    ControlToValidate="TextBox3"
                    ErrorMessage="Username is required field."
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
            </div>
                
            <div class="row"> 
                <h4>Email</h4>
            </div>
            <div class="row"> 
                <asp:TextBox ID="TextBox4" runat="server" cssclass="form-control" placeholder="Email"></asp:TextBox>
                <asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server"
                    ControlToValidate="TextBox4"
                    ErrorMessage="Email is required field."
                    ForeColor="Red" >
                </asp:RequiredFieldValidator>
            </div>

            <div class="row"> 
                <h4>Password</h4>
            </div>
            <div class="row"> 
                <asp:TextBox ID="TextBox5" runat="server" cssclass="form-control" placeholder="Password"></asp:TextBox>
                <asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server"
                    ControlToValidate="TextBox5"
                    ErrorMessage="Password is required field."
                    ForeColor="Red" >
                </asp:RequiredFieldValidator>
            </div>

            <div class="row"> 
                <h4>Phone</h4>
            </div>
            <div class="row"> 
                <asp:TextBox ID="TextBox6" runat="server" cssclass="form-control" placeholder="Phone"></asp:TextBox>
                <asp:RequiredFieldValidator id="RequiredFieldValidator6" runat="server"
                    ControlToValidate="TextBox6"
                    ErrorMessage="Phone is required field."
                    ForeColor="Red" >
                </asp:RequiredFieldValidator>
            </div>

            <br />

            <div class="row">
                <asp:Button ID="Button1" runat="server" Text="Sign Up" CssClass="rounded btn-primary btn-block btn-lg" OnClick="Button1_Click"/>
            </div><br />
        </div>
    </form>
</body>
</html>
