<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateMakeupBrand.aspx.cs" Inherits="MakeMeUpzz.Views.UpdateMakeupBrand" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MakeMeUpzz - Update Makeup Brand</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body style="background: linear-gradient(135deg, #f8bbd0, #e1bee7, #f3e5f5); color: #212121;">

    <form id="UpdateMakeupBrand" runat="server" class="container py-5">

        <!-- Header -->
        <div class="text-center mb-4">
            <h1 class="fw-bold" style="color: #8e24aa;">Update Makeup Brand</h1>
            <p class="text-muted mb-1">Brand ID: <strong><%=Request.QueryString["id"] %></strong></p>
            <hr class="border-3 rounded-pill mx-auto" style="width: 80px; border-color: #f8bbd0;" />
        </div>

        <!-- Form Card -->
        <div class="card shadow-lg border-0 mx-auto" style="max-width: 550px;">
            <div class="card-header text-white fw-semibold text-center" style="background-color: #ab47bc;">
                Update Brand Details
            </div>
            <div class="card-body bg-white rounded-bottom">

                <div class="mb-3">
                    <asp:Label ID="MakeupBrandNameLbl" runat="server" Text="Makeup Brand Name" CssClass="form-label fw-semibold"></asp:Label>
                    <asp:TextBox ID="MakeupBrandNameTb" runat="server" CssClass="form-control rounded-pill bg-light border-0 shadow-sm"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <asp:Label ID="MakeupBrandRatingLbl" runat="server" Text="Makeup Brand Rating" CssClass="form-label fw-semibold"></asp:Label>
                    <asp:TextBox ID="MakeupBrandRatingTb" runat="server" CssClass="form-control rounded-pill bg-light border-0 shadow-sm"></asp:TextBox>
                </div>

                <div class="mb-3 text-center">
                    <asp:Label ID="ErrorLabel" runat="server" CssClass="text-danger fw-semibold"></asp:Label>
                </div>

                <div class="d-grid gap-2">
                    <asp:Button ID="UpdateMakeupBrandButton" runat="server"
                        Text="Update Makeup Brand"
                        CssClass="btn text-white fw-semibold rounded-pill py-2"
                        Style="background-color: #ec407a;"
                        OnClick="UpdateMakeupBrandButton_Click" />
                </div>
            </div>
        </div>

        <!-- Back Button -->
        <div class="text-center mt-4">
            <asp:Button ID="ToManageMakeup" runat="server"
                Text="← Back to Manage Makeup"
                CssClass="btn text-white rounded-pill px-4 fw-semibold"
                Style="background-color: #8e24aa;"
                OnClick="ToManageMakeup_Click" />
        </div>

    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
