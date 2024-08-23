<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderMakeup.aspx.cs" Inherits="MakeMeUpzz.Views.OrderMakeup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="OrderMakeup" runat="server">
        <h1>Order Makeup</h1>
        <hr />

        <div>
            <asp:GridView ID="OrderMakeupGV" runat="server" DataKeyNames="MakeupID" AutoGenerateColumns="False" OnRowCommand="OrderMakeupGV_RowCommand">
                <Columns>
                    <asp:BoundField DataField="MakeupID" HeaderText="ID" SortExpression="MakeupID" />
                    <asp:BoundField DataField="MakeupName" HeaderText="Name" SortExpression="MakeupName" />
                    <asp:BoundField DataField="MakeupPrice" HeaderText="Price" SortExpression="MakeupPrice" />
                    <asp:BoundField DataField="MakeupWeight" HeaderText="Weight (grams)" SortExpression="MakeupWeight" />
                    <asp:TemplateField HeaderText="Input Quantity">
                        <ItemTemplate>
                            <asp:TextBox Placeholder="0" ID="QuantityTB" TextMode="Number" runat="server"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:ButtonField ButtonType="Button" CommandName="add_to_cart" Text="Add to Cart" />
                </Columns>
            </asp:GridView>
        </div>

        <br />

        <h3>Cart</h3>
        <div>
            <%-- <table style="width: 500px">
                 <tr>
                     <td>MakeupName</td>
                     <td><%= cartk.Makeup.MakeupName %></td>
                 </tr>
                 <tr>
                     <td>Customer</td>
                     <td><%= cartk.Quantity%></td>
                 </tr>
                
             </table>--%>
        </div>
        <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>--%>
        <asp:GridView ID="CartGridView" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="MakeupName" HeaderText="Makeup Name" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
            </Columns>
        </asp:GridView>
        <%--</ContentTemplate>
        </asp:UpdatePanel>--%>
        <div>
            <asp:Button ID="CheckoutBtn" runat="server" Text="Checkout" OnClick="CheckoutBtn_Click" />
            <asp:Button ID="ClearBtn" runat="server" Text="Clear Cart" OnClick="ClearBtn_Click" />
        </div>

        <div>
            <asp:Label ID="ErrorLabel" runat="server" ForeColor="Red" />
        </div>

        <br />
        <br />

        <div>
            <asp:Button ID="BackToHomePage" runat="server" Text="Back to Home Page" OnClick="BackToHomePage_Click" />
        </div>

    </form>
</body>
</html>
