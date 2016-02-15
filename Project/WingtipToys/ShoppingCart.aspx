<%@ Page Title="Shopping Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="WingtipToys.ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="ShoppingCartTitle" runat="server" class="ContentHead">
        <h1>Shopping Cart</h1>
    </div>
    <asp:GridView 
        ID="CartList"
        AutoGenerateColumns="False"
        GridLines="Vertical"
        CellPadding="4"
        ItemType="WingtipToys.Models.CartItem" 
        SelectMethod="GetShoppingCartItems"
        CssClass="table table-striped table-bordered"
        Caption="Table with products added to cart"
        OnRowCreated="CartList_RowCreated"
        OnRowDataBound="CartList_RowDataBound"
        runat="server">
        <Columns>
            <asp:BoundField DataField="ProductID" HeaderText="ID" SortExpression="ProductID" />
            <asp:BoundField DataField="Product.ProductName" HeaderText="Name" AccessibleHeaderText="" />
            <asp:BoundField DataField="Product.UnitPrice" HeaderText="Price (each)" DataFormatString="{0:c}" />
            <asp:TemplateField HeaderText="Quantity">
                <ItemTemplate>
                    <asp:TextBox ID="PurchaseQuantity" Width="40" runat="server" Text="<%#: Item.Quantity %>"
                        aria-label='<%# Eval("Product.ProductName") + " quantity" %>'>
                    </asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Item Total">
                <ItemTemplate>
                    <%#: String.Format("{0:c}", ((Convert.ToDouble(Item.Quantity)) *  Convert.ToDouble(Item.Product.UnitPrice)))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Remove Item">
                <ItemTemplate>
                    <asp:CheckBox ID="Remove" runat="server">
                    </asp:CheckBox>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <div>
        <p></p>
        <strong>
            <asp:Label ID="LabelTotalText" runat="server" Text="Order Total: "></asp:Label>
            <asp:Label ID="lblTotal" runat="server" EnableViewState="false"></asp:Label>
        </strong>
    </div>
    <br />
    <table>
        <tr>
            <td>
                <asp:Button ID="UpdateBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click" aria-label="Update products in cart" />
            </td>
            <td>
                <asp:ImageButton ID="CheckoutImageBtn" runat="server"
                    ImageUrl="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif"
                    Width="145" AlternateText="Check out with PayPal"
                    OnClick="CheckoutBtn_Click"
                    BackColor="Transparent" BorderWidth="0"
                    aria-label="Paypal checkout"
                    />
            </td>
        </tr>
    </table>
</asp:Content>
