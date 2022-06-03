<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="AddToCart.aspx.cs" Inherits="Project.AddToCart" %>
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
            <div class="card cardCart">
                <center>
                <div class="row">
                    <div class="col">
                        <asp:Label id="cartHeader" runat="server" CssClass="display-5" Text="Your Cart"></asp:Label>
                    </div>
                </div><hr class="hr-teal"/>
                        <a ID="Continue"
                            class="nav-link " href="index.aspx">Continue Shopping</a><br />
                <div class="row">
                    <div class="col">
                        <asp:GridView ID="CartView" runat="server" AutoGenerateColumns="False" BackColor="LightPink" BorderColor="#999999" BorderStyle="None" BorderWidth="4px" CellPadding="1" 
                            GridLines="Vertical"
                            Width="1200px"
                            OnRowDeleting="CartView_RowDeleting"
                            CellSpacing="3" >

                            <AlternatingRowStyle  BackColor="LightSkyBlue" />
                            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" 
                                BorderColor="#6600ff"
                                BorderWidth="4px"
                                Height="80px"
                                HorizontalAlign="Center" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <RowStyle  BackColor="Pink"  ForeColor="Black" 
                                Font-Bold="true"
                                BorderColor="#6600ff"
                                BorderWidth="4px"
                                Width="500px"
                                Height="100px"
                                HorizontalAlign="Center" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#0000A9" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#000065" />
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="ORDER ID" >
                                    <ItemStyle />
                                </asp:BoundField>
                                <asp:BoundField DataField="prod_id" HeaderText="PRODUCT ID" >
                                    <ItemStyle />
                                </asp:BoundField>
                                <asp:BoundField DataField="prod_name" HeaderText="PRODUCT NAME" >
                                    <ItemStyle />
                                </asp:BoundField>
                                <asp:ImageField  DataImageUrlField="image" HeaderText="IMAGE" >
                                    <ControlStyle Width="250px" Height="200px" 
                                        CssClass="rounded-5 w3-margin" 
                                        BorderWidth= "4px" 
                                        BorderColor= "Crimson" />
                                </asp:ImageField>   
                                <asp:BoundField DataField="category" HeaderText="CATEGORY" >
                                    <ItemStyle />
                                </asp:BoundField>
                                <asp:BoundField DataField="cost" HeaderText="COST" >
                                    <ItemStyle />
                                </asp:BoundField>
                                <asp:BoundField DataField="quantity" HeaderText="PRICE" >
                                    <ItemStyle />
                                </asp:BoundField>
                                <asp:BoundField DataField="amount" HeaderText="AMOUNT" >
                                    <ItemStyle />
                                </asp:BoundField>
                                <asp:CommandField DeleteText=Remove ShowDeleteButton="true"/>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <div class="row">
                    <div class="col"><br />
                        <asp:Button ID="ClearCart" runat="server" 
                            CssClass="btn linkButton2 "
                            Text="Clear Cart"/>
                        <asp:Button ID="OrderButton" runat="server" 
                            CssClass="btn linkButton2 "
                            Text="Place Order" OnClick="OrderButton_Click" />
                    </div>
                </div>              
                <div class="row">
                    <div class="col"></div>
                    <div class="col" >
                        <asp:Label id="cartFooter" runat="server" CssClass="display-5" Text=""></asp:Label>
                    </div>
                </div><hr class="hr-teal"/></center>
        </div> <br /></center>
    </div>
</asp:Content>
