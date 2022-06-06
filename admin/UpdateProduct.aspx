<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateProduct.aspx.cs" Inherits="Project.admin.UpdateProduct1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    <link rel="stylesheet" href="../style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="content"><br /><center>
            <div class="containerCard w3-responsive" style="width: 80%;">
            <div class="form-row" >
                <h2 style="font-weight:700;">Update a Product</h2>
            </div><br />
            <div class="w3-black" style="width: 20%;">Product ID:
                <asp:DropDownList ID="ProductIdSelector" runat="server" 
                    Width="75px"
                    Height="50px"
                    CssClass="btn btn-primary dropdown rounded-2 w3-margin w3-padding">
                </asp:DropDownList>
            </div>
            <hr class="hr-orange" /><br />
            <div class="row">
                <div class="col-6">                        
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

                    <div class="form-row"> 
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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ControlToValidate="TextBox3"
                            ErrorMessage="Description is a required field."
                            ForeColor="Red"
                            Font-Size="Smaller" ></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-6">                          
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
                    <div class="form-row">
                        <h4>Upload Image</h4>
                    </div>
                    <div class="form-row">
                        <center>
                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                        <br />
                        <asp:RequiredFieldValidator ID="FileUpLoadValidator" runat="server"
                            ControlToValidate="FileUpload1"
                            ErrorMessage="Image is a required field."
                            ForeColor="Red"
                            Font-Size="Smaller" ></asp:RequiredFieldValidator>
                        <br />
<%--                        <asp:RegularExpressionValidator
                            ID="FileUpExpressionValidator" runat="server"
                            ErrorMessage="Upload images only."
                            ForeColor="Red"
                            ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.jpg|.JPG|.jpeg|.JPEG.|.png|.PNG)$"
                            ControlToValidate="FileUpload1"> </asp:RegularExpressionValidator>--%>
                        </center>
                    </div>
                </div>
                    <div class="col w3-margin ">
                            <asp:Button ID="AdminCommandsButton" runat="server" Text="Update Product" CssClass="btn primary btn-lg linkButton" OnClick="AdminCommandsButton_Click" />
                    </div>            
                </div>
            </div></center>
          </div>
            <center><h5><a href="AdminHome.aspx" class="hint" >Back To Admin Home</a></h5></center><br />
  
</asp:Content>
