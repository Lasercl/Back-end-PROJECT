<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransactionHistory.aspx.cs" Inherits="MakeMeUpzz.Views.TransactionHistory" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Transaction History - MakeMeUpzz</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Bootstrap Only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
    <form id="TransactionHistory" runat="server">

        <!-- Container utama -->
        <div class="container py-5">
            <div class="text-center mb-5">
                <h1 class="fw-bold" style="color: #a64ac9;">Transaction History</h1>
                <p class="text-muted">Review your previous orders below 💅</p>
            </div>

            <!-- Card tabel -->
            <div class="card shadow-sm border-0">
                <div class="card-header text-white text-center fw-semibold" style="background-color: #d8b4fe;">
                    Your Transactions
                </div>
                <div class="card-body bg-white">
                    <asp:GridView 
                        ID="TransactionGV" 
                        runat="server" 
                        AutoGenerateColumns="false"
                        CssClass="table table-bordered table-hover align-middle text-center"
                        OnSelectedIndexChanged="TransactionGV_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="TransactionID" HeaderText="Transaction ID" SortExpression="TransactionID" />
                            <asp:BoundField DataField="UserID" HeaderText="User ID" SortExpression="UserID" />
                            <asp:BoundField DataField="TransactionDate" HeaderText="Transaction Date" SortExpression="TransactionDate" />
                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                            <asp:ButtonField CommandName="Select" Text="Detail" ButtonType="Button" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <!-- Tombol kembali -->
            <div class="text-center mt-4">
                <asp:Button 
                    ID="BackToHomePage" 
                    runat="server" 
                    Text="Back to Home Page"
                    CssClass="btn btn-lg fw-semibold text-white"
                    Style="background-color:#c77dff; border:none;"
                    OnClick="BackToHomePage_Click" />
            </div>
        </div>

        <!-- Footer -->
        <footer class="text-center mt-5 text-muted">
            <small>© 2025 MakeMeUpzz — Stay Pretty 💖</small>
        </footer>

    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
