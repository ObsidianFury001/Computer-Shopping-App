<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="Project.admin.AddProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="Project.admin.AddProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="content"><br /><center>
                <div class="containerCard w3-responsive">
            <div class="form-row">
                <h2 style="font-weight:700;">Add a Product</h2>
            </div><br />

            <hr class="hr-orange" /><br />
            <div class="form-row"> 
                <h4>Product Name</h4>
            </div>
            <div class="form-row">
                <asp:TextBox ID="TextBox1" runat="server" cssclass="form-control" placeholder="First Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="TextBox1"
                    ErrorMessage="Product Name is required field."
                    ForeColor="Red"
                    Font-Size="Smaller" ></asp:RequiredFieldValidator>
            </div>

            <div class="row"> 
                <h4>Category</h4>
            </div>
            <div class="form-row">
                <asp:TextBox ID="TextBox2" runat="server" cssclass="form-control" placeholder="Category"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="TextBox2"
                    ErrorMessage="Category is required field."
                    ForeColor="Red"
                    Font-Size="Smaller" ></asp:RequiredFieldValidator>
            </div>
                
            <div class="form-row">
                    <%--id, prod_name, category, desc, image, stock, cost--%>
                <h4>Description</h4>
            </div>
            <div class="form-row">
                <asp:TextBox ID="TextBox3" runat="server" cssclass="form-control" placeholder="Description"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                    ControlToValidate="TextBox3"
                    ErrorMessage="Description is required field."
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
                <h4>Confirm Password</h4>
            </div>
            <div class="form-row">
                <asp:TextBox ID="TextBox5Confirm" runat="server" cssclass="form-control" placeholder="Password"></asp:TextBox>
                <asp:RequiredFieldValidator id="RequiredFieldValidator5Confirm" runat="server"
                    ControlToValidate="TextBox5Confirm"
                    ErrorMessage="Password is required field."
                    ForeColor="Red" 
                    Font-Size="Smaller" ></asp:RequiredFieldValidator>
                <br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToValidate="TextBox5Confirm"
                    ControlToCompare="TextBox5"
                    ErrorMessage="Passwords do not match"
                    ForeColor="Red" 
                    Font-Size="Smaller"></asp:CompareValidator>
            </div>
            <div class="row w3-margin"> 
                <asp:Button ID="signUp" runat="server" Text="Sign Up" CssClass="btn primary btn-block btn-lg" />
            </div>
            
            <center><h5><a href="login.aspx" class="hint" >Already Signed Up? Click here to Sign In</a></h5></center>
        </div></center><br />
        </div>

    </form>
</body>
</html>

    </form>
</body>
</html>
