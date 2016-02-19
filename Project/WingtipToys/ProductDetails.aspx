<%@ Page Title="Product Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
         CodeBehind="ProductDetails.aspx.cs" Inherits="WingtipToys.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView ID="productDetail" runat="server" ItemType="WingtipToys.Models.Product" SelectMethod ="GetProduct" RenderOuterTable="false">
        <ItemTemplate>
            <div>
                <h1 role="heading" aria-level="1"><%#:Item.ProductName %></h1>
            </div>
            <br aria-hidden="true"/>
            <table role="presentation">
                <tr>
                    <td>
                        <img src="/Catalog/Images/<%#:Item.ImagePath %>"
                            style="border:solid; height:300px"
                            alt="<%#:Item.ProductName %>"/>
                    </td>
                    <td>&nbsp;</td>  
                    <td style="vertical-align: top; text-align:left;">
                        <b>Description:</b><br aria-hidden="true"/><%#:Item.Description %>
                        <br aria-hidden="true"/>
                        <span><b>Price:</b>&nbsp;<%#: String.Format("{0:c}", Item.UnitPrice) %></span>
                        <br aria-hidden="true"/>
                        <span><b>Product Number:</b><span class="hidden">&nbsp;</span><%#:Item.ProductID %></span>
                        <br aria-hidden="true"/>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
</asp:Content>