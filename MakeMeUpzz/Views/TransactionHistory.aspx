<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransactionHistory.aspx.cs" Inherits="MakeMeUpzz.Views.TransactionHistory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="TransactionHistory" runat="server">
        <h1>Transaction History</h1>

        <hr />

        <asp:GridView ID="TransactionGV" runat="server" AutoGenerateColumns="false" OnSelectedIndexChanged="TransactionGV_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="TransactionID" HeaderText="Transaction ID" SortExpression="TransactionID"></asp:BoundField>
                <asp:BoundField DataField="UserID" HeaderText="User ID" SortExpression="UserID"></asp:BoundField>
                <asp:BoundField DataField="TransactionDate" HeaderText="Transaction Date" SortExpression="TransactionDate"></asp:BoundField>
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status"></asp:BoundField>
                <asp:ButtonField CommandName="Select" Text="Detail" ButtonType="Button"></asp:ButtonField>
            </Columns>
        </asp:GridView>

        <br />
        <br />

        <div>
            <asp:Button ID="BackToHomePage" runat="server" Text="Back to Home Page" OnClick="BackToHomePage_Click" />
        </div>
    </form>
</body>
</html>
