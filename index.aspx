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
    <style type="text/css">
        .auto-style1 {
            height: 27px;
        }
    </style>
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
                                Interval="2000"
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
            
                <div class="w3-panel panel-orange flex-lg-shrink- w3-padding rounded-4" style="width: clamp(10%, 70vw, 100%);">
                    <table class="w3-padding-24 col-10">
                        <tr>
                            <td class="auto-style1 w3-margin w3-padding-16"><asp:DropDownList ID="searchFilter" runat="server"
                                    AutoPostBack="True"
                                    CssClass="btn btn-primary dropdown rounded-2 w3-responsive"
                                    OnSelectedIndexChanged="searchFilter_SelectedIndexChanged" 
                                    ToolTip="Search using Brand, Product name." 
                                    Width="120px"
                                    Height="48px">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style1 w3-margin-left w3-margin">
                                <asp:TextBox ID="SearchBox" runat="server" 
                                    CssClass="form-control-lg"  placeholder="Search" 
                                    style="width: clamp(10%, 90vw, 100%);">
                                </asp:TextBox>
                            </td>
                            <td class="auto-style1 w3-margin">
                                <asp:Button ID="Button1" runat="server" Text="Search" CssClass="btn linkButton"
                                    style="width: clamp(10%, 20vw, 100%);
                                            height:7vh;"/>                  
                            </td>
                        </tr>
                    </table>
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
                        <!-- Product Name -->
                        <tr>
                            <td>
                                <asp:Label BackColor="darkblue" ID="ProductName" runat="server" Text="Product Name"></asp:Label>
                            </td>
                        </tr>
                        
                        <!-- Image  -->
                        <tr>
                            <td>
                                <asp:Image ID="Image1" runat="server" Width="400px" Height="400px"/>
                            </td>
                        </tr>             
                        <!-- Description and Stock-->
                        <tr>
                            <td>
                                <asp:Label BackColor="darkblue" ID="Desc" runat="server" Text="Description"></asp:Label>
                            </td>  
                        </tr>                           
                        <!-- Price and Stock-->
                        <tr>
                            <td>
                                <asp:Label BackColor="darkblue" ID="Price" runat="server" Text="Price"></asp:Label>
                            </td>               
                            <td>
                                <asp:Label BackColor="darkblue" ID="Stock" runat="server" Text="Stock"></asp:Label>
                            </td>               
                        </tr>
                        <tr>
                            <asp:Label BackColor="darkblue" ID="ProductID" runat="server" Text="ProductID" Visible="false"></asp:Label>
                        </tr>

                    </table>
                </ItemTemplate>
            </asp:DataList>
        </div>
        </div>
</asp:Content>

