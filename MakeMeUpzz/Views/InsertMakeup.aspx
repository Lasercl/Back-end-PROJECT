<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsertMakeup.aspx.cs" Inherits="MakeMeUpzz.Views.InsertMakeup" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MakeMeUpzz - Insert Makeup</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light" style="background: linear-gradient(135deg, #f8bbd0, #e1bee7, #f3e5f5);">
    <form id="InsertMakeup" runat="server">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card shadow border-0">
                        <div class="card-header text-white text-center" style="background-color: #ba68c8;">
                            <h4 class="mb-0">Insert Makeup</h4>
                        </div>
                        <div class="card-body">
                            <div class="mb-3">
                                <asp:Label ID="MakeupNameLbl" runat="server" Text="Name" CssClass="form-label text-secondary"></asp:Label>
                                <asp:TextBox ID="MakeupNameTb" runat="server" CssClass="form-control" placeholder="Enter makeup name"></asp:TextBox>
                            </div>

                            <div class="mb-3">
                                <asp:Label ID="MakeupPriceLbl" runat="server" Text="Price" CssClass="form-label text-secondary"></asp:Label>
                                <asp:TextBox ID="MakeupPriceTb" runat="server" CssClass="form-control" placeholder="Enter makeup price"></asp:TextBox>
                            </div>

                            <div class="mb-3">
                                <asp:Label ID="MakeupWeightLbl" runat="server" Text="Weight (grams)" CssClass="form-label text-secondary"></asp:Label>
                                <asp:TextBox ID="MakeupWeightTb" runat="server" CssClass="form-control" placeholder="Enter makeup weight"></asp:TextBox>
                            </div>

                            <div class="mb-3">
                                <asp:Label ID="MakeupTypeID" runat="server" Text="Type ID" CssClass="form-label text-secondary"></asp:Label>
                                <asp:TextBox ID="MakeupTypeIDTb" runat="server" CssClass="form-control" placeholder="Enter type ID"></asp:TextBox>
                            </div>

                            <div class="mb-3">
                                <asp:Label ID="MakeupBrandID" runat="server" Text="Brand ID" CssClass="form-label text-secondary"></asp:Label>
                                <asp:TextBox ID="MakeupBrandIDTb" runat="server" CssClass="form-control" placeholder="Enter brand ID"></asp:TextBox>
                            </div>

                            <div class="text-center mb-3">
                                <asp:Label ID="ErrorLabel" runat="server" CssClass="text-danger fw-semibold" />
                            </div>

                            <div class="d-flex justify-content-center gap-3">
                                <asp:Button ID="InsertMakeupButton" runat="server" Text="Insert" CssClass="btn text-white px-4" Style="background-color: #ec407a;" OnClick="InsertMakeupButton_Click" />
                                <asp:Button ID="ToManageMakeup" runat="server" Text="Back" CssClass="btn text-white px-4" Style="background-color: #8e24aa;" OnClick="ToManageMakeup_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
