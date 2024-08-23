<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransactionDetail.aspx.cs" Inherits="MakeMeUpzz.Views.TransactionDetail" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Transaction Detail</title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Transaction Detail</h1>
        <hr />
        <asp:GridView ID="TransactionDetailGV" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="TransactionID" HeaderText="Transaction ID" SortExpression="TransactionID" />
                <asp:BoundField DataField="Makeup.MakeupID" HeaderText="Makeup ID" SortExpression="MakeupID" />
                <asp:BoundField DataField="Makeup.MakeupName" HeaderText="Name" SortExpression="MakeupName" />
                <asp:BoundField DataField="Makeup.MakeupPrice" HeaderText="Price" SortExpression="MakeupPrice" DataFormatString="{0:C}" HtmlEncode="false" />
                <asp:BoundField DataField="Makeup.MakeupWeight" HeaderText="Weight (grams)" SortExpression="MakeupName" />
                <asp:BoundField DataField="Makeup.MakeupType.MakeupTypeName" HeaderText="Type" SortExpression="MakeupTypeName" />
                <asp:BoundField DataField="Makeup.MakeupBrand.MakeupBrandName" HeaderText="Brand" SortExpression="MakeupBrandName" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:TemplateField HeaderText="Subtotal">
                    <ItemTemplate>
                        <%# GetSubtotal(Eval("Quantity"), Eval("Makeup.MakeupPrice")) %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <div>
            <asp:Button ID="BackToTransactionHistory" runat="server" Text="Back To Transaction History" OnClick="BackToTransactionHistory_Click" />
        </div>
        <br />
        <br />
        <div>
            <asp:Button ID="BackToHomePage" runat="server" Text="Back to Home Page" OnClick="BackToHomePage_Click" />
        </div>
    </form>
</body>
</html>
