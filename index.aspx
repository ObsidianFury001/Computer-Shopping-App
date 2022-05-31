<%@ Page Title="Home Page" MasterPageFile="~/Index.Master" Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Project.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <!-- Bootstrap Libraries -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

    <!-- W3 Libraries -->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />    
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-ios.css">
    <!-- Javascript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-index">
        <center><br />
            <div class="container">
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Timer ID="Timer1" runat="server" 
                                Interval="1000"
                                OnTick="Timer1_Tick">
                            </asp:Timer>
                            <asp:Image ID="Image2" runat="server" 
                                BackColor="DarkBlue"
                                BorderColor="Cyan"
                                BorderStyle="Groove"    
                                BorderWidth="5px"
                                CssClass="w3-image rounded-4"
                                Width="1000px"
                                Height="450px"
                                ImageAlign="Middle"/>
                        </ContentTemplate>
                    </asp:UpdatePanel>
            </div><br />
            
            <div style="width:clamp(10%,50%,74%);">
                <div class="navbar w3-padding-16 rounded-4">
                    <center><h3 class="navbar-brand align-items-center hint w3-margin">Product Search</h3>
                    </center>
                    <div class="navbar nav rounded-2 w3-margin">
                        <asp:DropDownList ID="searchFilter" runat="server" 
                            AutoPostBack="True"
                            CssClass="btn btn-primary dropdown rounded-2"
                            OnSelectedIndexChanged="searchFilter_SelectedIndexChanged" 
                            ToolTip="Search using Brand, Product name." 
                            Width="200px"
                            Height="50px">
                        </asp:DropDownList>
                        <asp:TextBox ID="TextBox1" runat="server" 
                            CssClass="form-control w3-margin"
                            style=" width: 200px;
                                    height: 50px;">
                        </asp:TextBox>
                        <asp:ImageButton ID="search" runat="server" 
                            CssClass="primary w3-margin"
                            ImageUrl="~/images/icons/search.png" 
                            Width="60px"
                            Height="50px" 
                            BorderStyle="Solid"
                            BorderWidth="3px"
                            BorderColor="cyan"
                            ToolTip="Search." />
                    </div>
                </div>
            </div><br />
        </center>
        <div> 
            <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal"
                BackColor="#DEBA84" 
                BorderColor="#DEBA84"
                BorderStyle="None" 
                BorderWidth="1px" 
                CellPadding="3" 
                CellSpacing="2" 
                GridLines="Both" >
                <FooterStyle BackColor="#F7DFB5 " ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <ItemTemplate> 
                    <table>
                        <div>
                            <!-- Product Name -->
                        <div class="row">
                            <div class="col">
                                <asp:Label BackColor="darkblue" ID="Label1" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>
                        
                        <!-- Image and Stock -->
                        <div class="row">
                            <div class="col">
                                <asp:Image ID="Image1" runat="server" Width="450px" Height="600px"/>
                            </div>
                            <div class="col">
                                <asp:Label BackColor="darkblue" ID="Label2" runat="server" Text="Stock"></asp:Label>
                            </div>               
                        </div>             
                        <!-- Description -->
                        <div class="row">
                            <div class="col">
                                <asp:Label BackColor="darkblue" ID="Label4" runat="server" Text="Description"></asp:Label>
                            </div>
                        </div>
                        <div class="col">
                            <asp:Label BackColor="darkblue" ID="Label3" runat="server" Text="ProductID"></asp:Label>
                        </div>
                        </div>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </div>
        </div>
</asp:Content>

