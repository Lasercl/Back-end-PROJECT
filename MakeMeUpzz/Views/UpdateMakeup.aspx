<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateMakeup.aspx.cs" Inherits="MakeMeUpzz.Views.UpdateMakeup" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MakeMeUpzz - Update Makeup</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body style="background: linear-gradient(135deg, #f8bbd0, #e1bee7, #f3e5f5); color: #212121;">

    <form id="UpdateMakeup" runat="server" class="container py-5">

        <!-- Header -->
        <div class="text-center mb-4">
            <h1 class="fw-bold" style="color: #8e24aa;">Update Makeup</h1>
            <p class="text-muted mb-1">Makeup ID: <strong><%=Request.QueryString["id"] %></strong></p>
            <hr class="border-3 rounded-pill mx-auto" style="width: 80px; border-color: #f8bbd0;" />
        </div>

        <!-- Form Card -->
        <div class="card shadow-lg border-0 mx-auto" style="max-width: 550px;">
            <div class="card-header text-white fw-semibold" style="background-color: #ba68c8;">
                Update Makeup Details
            </div>
            <div class="card-body bg-white rounded-bottom">
                
                <div class="mb-3">
                    <asp:Label ID="MakeupNameLbl" runat="server" Text="Name" CssClass="form-label fw-semibold"></asp:Label>
                    <asp:TextBox ID="MakeupNameTb" runat="server" CssClass="form-control rounded-pill bg-light border-0 shadow-sm"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <asp:Label ID="MakeupPriceLbl" runat="server" Text="Price" CssClass="form-label fw-semibold"></asp:Label>
                    <asp:TextBox ID="MakeupPriceTb" runat="server" CssClass="form-control rounded-pill bg-light border-0 shadow-sm"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <asp:Label ID="MakeupWeightLbl" runat="server" Text="Weight (grams)" CssClass="form-label fw-semibold"></asp:Label>
                    <asp:TextBox ID="MakeupWeightTb" runat="server" CssClass="form-control rounded-pill bg-light border-0 shadow-sm"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <asp:Label ID="MakeupTypeID" runat="server" Text="Type ID" CssClass="form-label fw-semibold"></asp:Label>
                    <asp:TextBox ID="MakeupTypeIDTb" runat="server" CssClass="form-control rounded-pill bg-light border-0 shadow-sm"></asp:TextBox>
                </div>

                <div class="mb-4">
                    <asp:Label ID="MakeupBrandID" runat="server" Text="Brand ID" CssClass="form-label fw-semibold"></asp:Label>
                    <asp:TextBox ID="MakeupBrandIDTb" runat="server" CssClass="form-control rounded-pill bg-light border-0 shadow-sm"></asp:TextBox>
                </div>

                <div class="d-grid gap-2">
                    <asp:Button ID="UpdateMakeupButton" runat="server"
                        Text="Update Makeup"
                        CssClass="btn text-white fw-semibold rounded-pill py-2"
                        Style="background-color: #ec407a;"
                        OnClick="UpdateMakeupButton_Click" />
                </div>
            </div>
        </div>

        <!-- Back Button -->
        <div class="text-center mt-4">
            <a href="ManageMakeup.aspx" class="btn rounded-pill text-white px-4 fw-semibold" style="background-color: #8e24aa;">
                ← Back to Manage Makeup
            </a>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
