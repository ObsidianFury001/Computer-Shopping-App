<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateProduct2.aspx.cs" Inherits="Project.admin.UpdateProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark rounded-bottom sticky-top" 
            style="width: clamp(10%, 100%, 101%)">
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
                    <ul class="navbar-nav justify-content-evenly align-items-center w3-padding w3-margin">
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
      <div class="content"><br /><center>
            <div class="containerCard w3-responsive">
            <div class="form-row" >
                <h2 style="font-weight:700;">Update a Product</h2>
            </div><br />

            <hr class="hr-orange" /><br />
            <div class="form-row"> 
                <h4>Product Name</h4>
            </div>
            <div class="form-row">
                <asp:TextBox ID="TextBox1" runat="server" cssclass="form-control text-capitalize" placeholder="Product Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="TextBox1"
                    ErrorMessage="Product Name is a required field."
                    ForeColor="Red"
                    Font-Size="Smaller" ></asp:RequiredFieldValidator>
            </div>

            <div class="row"> 
                <h4>Category</h4>
            </div>
            <div class="form-row">
                <asp:TextBox ID="TextBox2" runat="server" cssclass="form-control capitalize"  placeholder="Category"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="TextBox2"
                    ErrorMessage="Category is a required field."
                    ForeColor="Red"
                    Font-Size="Smaller" ></asp:RequiredFieldValidator>
            </div>
                
            <div class="form-row">
                    <%--id, prod_name, category, desc, image, stock, cost--%>
                <h4>Description</h4>
            </div>
            <div class="form-row">
                <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine" cssclass="form-control" placeholder="Description"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                    ControlToValidate="TextBox3"
                    ErrorMessage="Description is a required field."
                    ForeColor="Red"
                    Font-Size="Smaller" ></asp:RequiredFieldValidator>
            </div>
                
            <div class="form-row">
                <h4>Upload Image</h4>
            </div>
            <div class="form-row">
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                <br />
                <asp:RegularExpressionValidator
                    ID="FileUpLoadValidator" runat="server"
                    ErrorMessage="Upload Jpegs and Gifs only."
                    ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.jpg|.JPG|.jpeg|.JPEG.|.png|.PNG)$"
                    ControlToValidate="FileUpload1">  
                </asp:RegularExpressionValidator> <br />
                <asp:Label id="Label1" runat="server" Text=""></asp:Label>
            </div>
            
            <div class="form-row">
                <h4>Product Stock</h4>
            </div>
            <div class="form-row">
                <asp:TextBox ID="TextBox4" runat="server" cssclass="form-control" placeholder="Stock"></asp:TextBox>
                <asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server"
                    ControlToValidate="TextBox4"
                    ErrorMessage="Stock is a required field."
                    ForeColor="Red" 
                    Font-Size="Smaller" ></asp:RequiredFieldValidator>
            </div>
        
            <div class="form-row">
                <h4>Product Cost</h4>
            </div>
            <div class="form-row">
                <asp:TextBox ID="TextBox5" runat="server" cssclass="form-control" placeholder="Cost"></asp:TextBox>
                <asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server"
                    ControlToValidate="TextBox5"
                    ErrorMessage="Cost is a required field."
                    ForeColor="Red" 
                    Font-Size="Smaller" ></asp:RequiredFieldValidator>
            </div>
            <div class="row w3-margin"> 
                <asp:Button ID="AdminCommandsButton" runat="server" Text="Add Product" CssClass="btn primary btn-block btn-lg" OnClick="AdminCommandsButton_Click" />
            </div>
            
            <center><h5><a href="AdminHome.aspx" class="hint" >Back To Admin Home</a></h5></center>
        </div></center><br />
    </div>
    </form>
</body>
</html>
