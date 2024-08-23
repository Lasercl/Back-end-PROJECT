<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageMakeup.aspx.cs" Inherits="MakeMeUpzz.Views.ManageMakeup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MakeMeUpzz - Manage Makeup</title>
</head>
<body>
    <form id="ManageMakeup" runat="server">
        <h1>Manage Makeup</h1>
        <hr />

        <h2>Makeup</h2>
        <div>
            <asp:GridView ID="MakeupGV" runat="server" AutoGenerateColumns="False" OnRowDeleting="MakeupGV_RowDeleting" OnRowEditing="MakeupGV_RowEditing">
                <Columns>
                    <asp:BoundField DataField="MakeupID" HeaderText="ID" SortExpression="MakeupID" />
                    <asp:BoundField DataField="MakeupName" HeaderText="Makeup Name" SortExpression="MakeupName" />
                    <asp:BoundField DataField="MakeupPrice" HeaderText="Price" SortExpression="MakeupPrice" />
                    <asp:BoundField DataField="MakeupWeight" HeaderText="Weight (grams)" SortExpression="MakeupWeight" />
                    <asp:BoundField DataField="MakeupTypeID" HeaderText="Type ID" SortExpression="MakeupTypeID" />
                    <asp:BoundField DataField="MakeupBrandID" HeaderText="Brand ID" SortExpression="MakeupBrandID" />
                    <asp:CommandField ButtonType="Button" HeaderText="Actions" ShowCancelButton="False" ShowDeleteButton="True" ShowEditButton="True" ShowHeader="True" />
                </Columns>
            </asp:GridView>
        </div>

        <div>
            <asp:Button ID="ToInsertMakeupButton" runat="server" Text="Insert Makeup" OnClick="ToInsertMakeupButton_Click" />
        </div>

        <br />
        <br />

        <h2>Makeup Type</h2>
        <div>
            <asp:GridView ID="MakeupTypeGV" runat="server" AutoGenerateColumns="False" OnRowEditing="MakeupTypeGV_RowEditing" OnRowDeleting="MakeupTypeGV_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="MakeupTypeID" HeaderText="ID" SortExpression="MakeupTypeID" />
                    <asp:BoundField DataField="MakeupTypeName" HeaderText="Type Name" SortExpression="MakeupTypeName" />
                    <asp:CommandField ButtonType="Button" HeaderText="Actions" ShowCancelButton="False" ShowDeleteButton="True" ShowEditButton="True" ShowHeader="True" />
                </Columns>
            </asp:GridView>
        </div>

        <div>
            <asp:Button ID="ToInsertMakeupTypeButton" runat="server" Text="Insert Makeup Type" OnClick="ToInsertMakeupTypeButton_Click" />
        </div>

        <br />
        <br />

        <h2>Makeup Brand</h2>
        <div>
            <asp:GridView ID="MakeupBrandGV" runat="server" AutoGenerateColumns="False" AllowSorting="true" OnRowDeleting="MakeupBrandGV_RowDeleting" OnRowEditing="MakeupBrandGV_RowEditing" OnSorting="MakeupBrandGV_Sorting">
                <Columns>
                    <asp:BoundField DataField="MakeupBrandID" HeaderText="ID" SortExpression="MakeupBrandID" />
                    <asp:BoundField DataField="MakeupBrandName" HeaderText="Brand Name" SortExpression="MakeupBrandName" />
                    <asp:BoundField DataField="MakeupBrandRating" HeaderText="Brand Rating" SortExpression="MakeupBrandRating" />
                    <asp:CommandField ButtonType="Button" HeaderText="Actions" ShowCancelButton="False" ShowDeleteButton="True" ShowEditButton="True" ShowHeader="True" />
                </Columns>
            </asp:GridView>
        </div>

        <div>
            <asp:Button ID="ToInsertMakeupBrandButton" runat="server" Text="Insert Makeup Brand" OnClick="ToInsertMakeupBrandButton_Click" />
        </div>

        <br />
        <br />
        <br />

        <div>
            <asp:Button ID="BackToHomePage" runat="server" Text="Back to Home Page" OnClick="BackToHomePage_Click" />
        </div>

    </form>
</body>
</html>
