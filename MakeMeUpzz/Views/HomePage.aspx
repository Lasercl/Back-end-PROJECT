<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="MakeMeUpzz.Views.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MakeMeUpzz - Home</title>
    <link href="../style/HomePage.css" rel="stylesheet"/>
</head>
<body>
    <form id="Home" runat="server">
        <h1>Home</h1>

        <div class="navbar">
            <asp:Repeater ID="NavRepeater" runat="server">
                <ItemTemplate>
                    <a href="<%# Eval("Url") %>"><%# Eval("Title") %></a>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <br />
        <div Class="isihomepage">
            <div>
                <asp:Label ID="WelcomeLbl" runat="server" Text="" />
                <br />
                <asp:Label ID="RoleLbl" runat="server" Text="" /><br />
            </div>
            <div>
                <asp:GridView ID="UserGV" AutoGenerateColumns="False" runat="server">
                    <Columns>
                        <asp:BoundField DataField="UserID" HeaderText="ID" SortExpression="UserID" />
                        <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                        <asp:BoundField DataField="UserEmail" HeaderText="Email" SortExpression="UserEmail" />
                        <asp:BoundField DataField="UserDOB" HeaderText="Date of Birth" SortExpression="UserDOB" />
                        <asp:BoundField DataField="UserGender" HeaderText="Gender" SortExpression="UserGender" />
                        <asp:BoundField DataField="UserRole" HeaderText="Role" SortExpression="UserRole" />
                        <asp:BoundField DataField="UserPassword" HeaderText="Password" SortExpression="UserPassword" />
                    </Columns>
                </asp:GridView>
            </div>

            <br />
            <asp:Label ID="MessageLbl" runat="server" Visible="true" ForeColor="Red" Text=""></asp:Label>
            <br />

            <div>
                <asp:Button ID="LogoutBtn" runat="server" Text="Logout" OnClick="LogoutBtn_Click" />
            </div>
        </div>

    </form>
</body>
</html>
