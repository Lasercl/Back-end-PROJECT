<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsertMakeupType.aspx.cs" Inherits="MakeMeUpzz.Views.InsertMakeupType" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MakeMeUpzz - Insert Makeup Type</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body style="background: linear-gradient(135deg, #f8bbd0, #e1bee7, #f3e5f5);">
    <form id="InsertMakeupType" runat="server">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card shadow border-0">
                        <div class="card-header text-center text-white fw-semibold" style="background-color: #ba68c8;">
                            Insert Makeup Type
                        </div>
                        <div class="card-body">
                            <div class="mb-3">
                                <asp:Label ID="MakeupTypeNameLbl" runat="server" Text="Makeup Type Name" CssClass="form-label text-secondary"></asp:Label>
                                <asp:TextBox ID="MakeupTypeNameTb" runat="server" CssClass="form-control" placeholder="Enter makeup type name"></asp:TextBox>
                            </div>

                            <div class="text-center mb-3">
                                <asp:Label ID="ErrorLabel" runat="server" CssClass="text-danger fw-semibold" />
                            </div>

                            <div class="d-flex justify-content-center gap-3">
                                <asp:Button ID="InsertMakeupTypeButton" runat="server" Text="Insert" CssClass="btn text-white px-4" Style="background-color: #ec407a;" OnClick="InserMakeupTypeButton_Click" />
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
