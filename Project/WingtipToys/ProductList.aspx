<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ProductList.aspx.cs" Inherits="WingtipToys.ProductList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section>
        <div>
            <hgroup>
                <h2 role="heading" aria-level="1"><%: Page.Title %></h2>
            </hgroup>

            <asp:ListView ID="productList" 
                runat="server"
                DataKeyNames="ProductID" 
                GroupItemCount="4"
                ItemType="WingtipToys.Models.Product" 
                SelectMethod="GetProducts">
                <EmptyDataTemplate>
                    <table>
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td aria-hidden="true" />
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server" role="presentation">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <ItemTemplate>
                    <td role="listitem">
                        <table>
                            <tr>
                                <td>
                                    <a href="<%#: GetRouteUrl("ProductByNameRoute", new {productName = Item.ProductName}) %>">
                                        <image src='/Catalog/Images/Thumbs/<%#:Item.ImagePath%>'
                                            width="100" height="75" border="1" alt="<%#:Item.ProductName%>" />
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="<%#: GetRouteUrl("ProductByNameRoute", new {productName = Item.ProductName}) %>">
                                        <%#:Item.ProductName%>
                                    </a>
                                    <br aria-hidden="true"/>
                                    <span>
                                        <b>Price: </b><%#:String.Format("{0:c}", Item.UnitPrice)%>
                                    </span>
                                    <br aria-hidden="true"/>
                                    <a href="/AddToCart.aspx?productID=<%#:Item.ProductID %>" aria-label="Add To Cart <%#:Item.ProductName%>">
                                        <span class="ProductListItem">
                                            <b>Add To Cart<b>
                                        </span>
                                    </a>
                                </td>
                            </tr>
                            <tr aria-hidden="true">
                                <td aria-hidden="true">&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table id="ProductsList" style="width: 100%;" runat="server">
                        <tbody>
                            <tr>
                                <td>
                                    <table id="groupPlaceholderContainer" runat="server" style="width: 100%" role="list">
                                        <tr id="groupPlaceholder"></tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr></tr>
                        </tbody>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
        </div>
    </section>
</asp:Content>
