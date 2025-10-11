<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsertMakeupBrand.aspx.cs" Inherits="MakeMeUpzz.Views.InsertMakeupBrand" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MakeMeUpzz - Insert Makeup Brand</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body style="background: linear-gradient(135deg, #f8bbd0, #e1bee7, #f3e5f5);">

    <form id="InsertMakeupBrand" runat="server">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <!-- Card utama -->
                    <div class="card shadow-lg border-0 rounded-4" style="background-color: #ffffff;">
                        <div class="card-header text-white text-center fw-bold fs-4 rounded-top-4" style="background-color: #ba68c8;">
                            Insert Makeup Brand
                        </div>
                        <div class="card-body p-4 text-center" style="color: #212121;">

                            <div class="mb-3 text-start">
                                <asp:Label ID="MakeupBrandNameLbl" runat="server" Text="Makeup Brand Name" CssClass="form-label fw-semibold" />
                                <asp:TextBox ID="MakeupBrandNameTb" runat="server" CssClass="form-control border-2 border-light rounded-pill" placeholder="Enter brand name" />
                            </div>

                            <div class="mb-3 text-start">
                                <asp:Label ID="MakeupBrandRatingLbl" runat="server" Text="Makeup Brand Rating" CssClass="form-label fw-semibold" />
                                <asp:TextBox ID="MakeupBrandRatingTb" runat="server" CssClass="form-control border-2 border-light rounded-pill" placeholder="Enter brand rating (1-5)" />
                            </div>

                            <div class="my-3">
                                <asp:Label ID="ErrorLabel" runat="server" CssClass="text-danger fw-semibold" />
                            </div>

                            <div class="d-grid gap-2">
                                <asp:Button ID="InserMakeupBrandButton" runat="server" 
                                    Text="Insert Makeup Brand" 
                                    CssClass="btn rounded-pill text-white fw-bold" 
                                    Style="background-color: #ec407a; border: none;" 
                                    OnClick="InserMakeupBrandButton_Click" />

                                <asp:Button ID="ToManageMakeup" runat="server" 
                                    Text="Back to Manage Makeup" 
                                    CssClass="btn rounded-pill fw-semibold text-white" 
                                    Style="background-color: #8e24aa; border: none;" 
                                    OnClick="ToManageMakeup_Click" />
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

</body>
</html>
