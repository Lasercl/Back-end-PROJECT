<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateMakeupType.aspx.cs" Inherits="MakeMeUpzz.Views.UpdateMakeupType" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MakeMeUpzz - Update Makeup Type</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light" style="background: linear-gradient(135deg, #f8bbd0, #e1bee7, #f3e5f5);">
    <form id="UpdateMakeupType" runat="server">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card shadow border-0">
                        <div class="card-header text-white text-center" style="background-color: #ab47bc;">
                            <h4 class="mb-0">Update Makeup Type</h4>
                        </div>
                        <div class="card-body">
                            <div class="text-center text-secondary mb-3">
                                <small>ID: <strong><%= Request.QueryString["id"] %></strong></small>
                            </div>

                            <div class="mb-3">
                                <asp:Label ID="MakeupTypeNameLbl" runat="server" Text="Makeup Type Name" CssClass="form-label text-secondary"></asp:Label>
                                <asp:TextBox ID="MakeupTypeNameTb" runat="server" CssClass="form-control" placeholder="Enter makeup type name"></asp:TextBox>
                            </div>

                            <div class="text-center mb-3">
                                <asp:Label ID="ErrorLabel" runat="server" CssClass="text-danger fw-semibold" />
                            </div>

                            <div class="d-flex justify-content-center gap-3">
                                <asp:Button ID="UpdateMakeupTypeButton" runat="server" Text="Update" CssClass="btn text-white px-4" Style="background-color: #ec407a;" OnClick="UpdateMakeupTypeButton_Click" />
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
