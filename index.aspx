﻿<%@ Page Title="Home Page" MasterPageFile="~/Index.Master" Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Project.index" %>
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
            
                <div class="w3-panel panel-orange w3-padding rounded-4" 
                    style="width: clamp(10%, 70vw, 100%);
                            height: 100px;">
                    <table class="w3-padding-24 col-7">
                        <tr>
                            <td class="w3-margin w3-padding-16"><asp:DropDownList ID="searchFilter" runat="server"
                                    AutoPostBack="True"
                                    CssClass="btn btn-primary dropdown rounded-2"
                                    OnSelectedIndexChanged="searchFilter_SelectedIndexChanged" 
                                    ToolTip="Search using Brand, Product name." 
                                    Width="180px"
                                    Height="48px">
                                </asp:DropDownList>
                            </td>
                            <td class="w3-margin-left w3-margin">
                                <asp:TextBox ID="SearchBox" runat="server" 
                                    CssClass="form-control-lg"  placeholder="Search" 
                                    style="width: clamp(30%, 20vw, 100%);">
                                </asp:TextBox>
                            </td>
                            <td class=" w3-margin">
                                <asp:Button ID="SearchButton" runat="server" Text="Search" CssClass="btn linkButton"
                                    style="width: clamp(10%, 20vw, 100%);
                                            height:48px;" OnClick="SearchButton_Click"/>                  
                            </td>
                        </tr>
                    </table>
                    <br />
                </div>
            <br />
              <asp:DataList ID="ProductList" runat="server" 
                RepeatColumns="2" 
                RepeatDirection="Horizontal"
                BackColor="#9999ff"
                BorderColor="Cyan"
                BorderWidth="5px"
                CellPadding="1" 
                CellSpacing="1"
                CssClass="w3-margin "
                GridLines="Both">

                <FooterStyle BackColor="#F7DFB5 " ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#6699ff" ForeColor="#8C4510" />
                <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <ItemTemplate > 
                    <table class="w3-margin rounded-3" 
                        style="padding: 2%;
                            width: 400px;
                            height: 350px;
                            border: 5px solid black; 
                            border-radius: .75rem;">    
                        <!-- Product Name -->
                        <tr class="w3-red"  style="width: 100%;" >
                            <td style="text-align: center;">
                                <asp:Label ID="ProductName" runat="server" Text='<%#Eval("prod_name")%>'  
                                    Font-Bold="true"
                                    ForeColor="Cyan"  >
                                </asp:Label>
                            </td>
                        </tr>
                        <!-- Image  -->
                        <tr style="background-color: var(--table-border);
                                    width: var(--cell-width);" >
                            <td style="text-align: center;
                                    width: var(--cell-width);" >
                                <asp:Image ID="Image1" runat="server"  Width="400px" Height="400px" ImageUrl='<%# Eval("image")%>' class="rounded-3 w3-margin" style="border: 4px solid orange;"/>
                            </td>
                            <!-- Price and Stock-->
                        <tr class="w3-yellow" style="width: var(--cell-width);" >
                            <td style="text-align: center;
                                    width: var(--cell-width);" >&nbsp;Price:&nbsp;
                                <asp:Label ID="Price" runat="server" Text='<%#Eval("cost")%>' 
                                    Font-Bold="true"></asp:Label>
                            </td>             
                        </tr>
                        <tr class="w3-ios-dark-blue" style="width: var(--cell-width);" > 
                            <td style="text-align: center;
                                    width: var(--cell-width);" >&nbsp;Stock:&nbsp;
                                <asp:Label ID="Stock" runat="server" Text='<%#Eval("stock")%>'></asp:Label>
                            </td>               
                        </tr> 
                        <!-- Category and Description-->
                        <tr class="w3-yellow" style="width: var(--cell-width);" >
                            <td style="text-align: center;
                                    width: var(--cell-width);">Category:&nbsp;
                                <asp:Label ID="Category" runat="server" Text='<%#Eval("category")%>'></asp:Label>
                            </td>  
                        </tr>
                        <tr class="w3-green text-white" style="width: var(--cell-width);" > 
                            <td style="text-align: center;
                                    height: 120px;" >Description:&nbsp;
                                <asp:Label ID="Desc" runat="server" Text='<%#Eval("desc")%>'></asp:Label>
                            </td>  
                        </tr>                           
                        <tr style="background-color: darkblue;
                                width: var(--cell-width);" >
                            <asp:Label BackColor="darkblue" ID="ProductID" runat="server" Text='<%#Eval("id")%>' Visible="false"></asp:Label>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </center>
        </div>
</asp:Content>

