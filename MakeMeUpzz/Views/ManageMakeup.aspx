<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageMakeup.aspx.cs" Inherits="MakeMeUpzz.Views.ManageMakeup" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MakeMeUpzz - Manage Makeup</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body style="background: linear-gradient(135deg, #f8bbd0, #e1bee7, #f3e5f5); color: #212121;">

    <form id="ManageMakeup" runat="server" class="container py-5">
        <!-- Header -->
        <div class="text-center mb-5">
            <h1 class="fw-bold" style="color: #8e24aa;">Manage Makeup</h1>
            <p class="text-muted">Kelola koleksi makeup, tipe, dan brand dengan mudah 💄</p>
            <hr class="border-3 rounded-pill mx-auto" style="width: 80px; border-color: #f8bbd0;" />
        </div>

        <!-- Makeup Section -->
        <div class="card shadow-lg mb-5">
            <div class="card-header text-white fw-bold" style="background-color: #ba68c8;">
                Makeup
            </div>
            <div class="card-body bg-white rounded-bottom">
                <asp:GridView ID="MakeupGV" runat="server" AutoGenerateColumns="False"
                    CssClass="table table-hover align-middle text-center"
                    OnRowDeleting="MakeupGV_RowDeleting" OnRowEditing="MakeupGV_RowEditing">
                    <Columns>
                        <asp:BoundField DataField="MakeupID" HeaderText="ID" />
                        <asp:BoundField DataField="MakeupName" HeaderText="Makeup Name" />
                        <asp:BoundField DataField="MakeupPrice" HeaderText="Price" />
                        <asp:BoundField DataField="MakeupWeight" HeaderText="Weight (grams)" />
                        <asp:BoundField DataField="MakeupTypeID" HeaderText="Type ID" />
                        <asp:BoundField DataField="MakeupBrandID" HeaderText="Brand ID" />
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>
                </asp:GridView>

                <div class="text-end mt-3">
                    <asp:Button ID="ToInsertMakeupButton" runat="server"
                        Text="Insert Makeup"
                        CssClass="btn rounded-pill text-white px-4" 
                        Style="background-color: #ec407a;"
                        OnClick="ToInsertMakeupButton_Click" />
                </div>
            </div>
        </div>

        <!-- Makeup Type Section -->
        <div class="card shadow-lg mb-5">
            <div class="card-header text-white fw-bold" style="background-color: #ab47bc;">
                Makeup Type
            </div>
            <div class="card-body bg-white rounded-bottom">
                <asp:GridView ID="MakeupTypeGV" runat="server" AutoGenerateColumns="False"
                    CssClass="table table-hover align-middle text-center"
                    OnRowDeleting="MakeupTypeGV_RowDeleting" OnRowEditing="MakeupTypeGV_RowEditing">
                    <Columns>
                        <asp:BoundField DataField="MakeupTypeID" HeaderText="ID" />
                        <asp:BoundField DataField="MakeupTypeName" HeaderText="Type Name" />
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>
                </asp:GridView>

                <div class="text-end mt-3">
                    <asp:Button ID="ToInsertMakeupTypeButton" runat="server"
                        Text="Insert Makeup Type"
                        CssClass="btn rounded-pill text-white px-4"
                        Style="background-color: #ec407a;"
                        OnClick="ToInsertMakeupTypeButton_Click" />
                </div>
            </div>
        </div>

        <!-- Makeup Brand Section -->
        <div class="card shadow-lg mb-5">
            <div class="card-header text-white fw-bold" style="background-color: #ba68c8;">
                Makeup Brand
            </div>
            <div class="card-body bg-white rounded-bottom">
                <asp:GridView ID="MakeupBrandGV" runat="server" AutoGenerateColumns="False" AllowSorting="true"
                    CssClass="table table-hover align-middle text-center"
                    OnRowDeleting="MakeupBrandGV_RowDeleting" OnRowEditing="MakeupBrandGV_RowEditing"
                    OnSorting="MakeupBrandGV_Sorting">
                    <Columns>
                        <asp:BoundField DataField="MakeupBrandID" HeaderText="ID" />
                        <asp:BoundField DataField="MakeupBrandName" HeaderText="Brand Name" />
                        <asp:BoundField DataField="MakeupBrandRating" HeaderText="Brand Rating" />
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>
                </asp:GridView>

                <div class="text-end mt-3">
                    <asp:Button ID="ToInsertMakeupBrandButton" runat="server"
                        Text="Insert Makeup Brand"
                        CssClass="btn rounded-pill text-white px-4"
                        Style="background-color: #ec407a;"
                        OnClick="ToInsertMakeupBrandButton_Click" />
                </div>
            </div>
        </div>

        <!-- Back Button -->
        <div class="text-center">
            <asp:Button ID="BackToHomePage" runat="server"
                Text="Back to Home Page"
                CssClass="btn rounded-pill px-4 text-white"
                Style="background-color: #8e24aa;"
                OnClick="BackToHomePage_Click" />
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
