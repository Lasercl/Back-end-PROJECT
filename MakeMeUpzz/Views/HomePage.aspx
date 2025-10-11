<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="MakeMeUpzz.Views.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MakeMeUpzz - Home</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>

<body class="bg-light" style="background: linear-gradient(135deg, #f8bbd0, #e1bee7, #f3e5f5); min-height: 100vh;">
    <form id="Home" runat="server">

        <!-- NAVBAR -->
        <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm py-3">
            <div class="container-fluid">
                <a class="navbar-brand fw-bold" style="color: #8e24aa;" href="#">MakeMeUpzz</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                    <asp:Repeater ID="NavRepeater" runat="server">
                        <ItemTemplate>
                            <a class="nav-link fw-semibold px-3 text-decoration-none" style="color:#ec407a;" href="<%# Eval("Url") %>">
                                <%# Eval("Title") %>
                            </a>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </nav>

        <div class="container my-5">
            <!-- Welcome Section -->
            <div class="text-center mb-4">
                <h1 class="fw-bold mb-1" style="color:#8e24aa;">Welcome to MakeMeUpzz</h1>
                <asp:Label ID="WelcomeLbl" runat="server" Text="" CssClass="h5 text-dark d-block fw-semibold mb-1" />
                <asp:Label ID="RoleLbl" runat="server" Text="" CssClass="text-muted d-block" />
            </div>
          
            <!-- Data Section -->
                <div ID="AdminPanel" runat="server" class="card border-0 shadow-lg rounded-4 mb-4">
                    <div class="card-header text-white text-center rounded-top-4 fw-semibold" style="background-color:#ba68c8;">
                        <h5 class="mb-0">User Data</h5>
                    </div>
                    <div class="card-body bg-white rounded-bottom-4">
                        <asp:GridView ID="UserGV" runat="server" AutoGenerateColumns="False"
                            CssClass="table table-hover align-middle text-center mb-0 border">
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
                </div>


            <!-- Message -->
            <div class="text-center mb-4">
                <asp:Label ID="MessageLbl" runat="server" Visible="true" ForeColor="Red"
                    CssClass="fw-semibold fs-6" />
            </div>

            <!-- Logout -->
            <div class="text-center">
                <asp:Button ID="LogoutBtn" runat="server" Text="Logout" OnClick="LogoutBtn_Click"
                    CssClass="btn btn-lg text-white fw-semibold rounded-pill px-5 shadow-sm"
                    style="background-color:#ec407a; border:none;" />
            </div>
        </div>

        <!-- FOOTER -->
        <footer class="text-center py-3 mt-auto text-muted small">
            © 2025 MakeMeUpzz — crafted with 💗
        </footer>

    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
