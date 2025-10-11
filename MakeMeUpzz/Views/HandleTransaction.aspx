<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HandleTransaction.aspx.cs" Inherits="MakeMeUpzz.Views.HandleTransaction" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MakeMeUpzz - Handle Transaction</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>

<body style="background: linear-gradient(135deg, #f8bbd0, #e1bee7, #f3e5f5); color: #212121;">

    <form id="HandleTransaction" runat="server">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <!-- CARD -->
                    <div class="card shadow-lg border-0 rounded-4" style="background-color: #ffffff;">
                        <div class="card-header text-white text-center fw-bold fs-4 rounded-top-4" style="background-color: #ba68c8;">
                            Handle Transactions
                        </div>

                        <div class="card-body p-4">

                            <div class="table-responsive">
                                <asp:GridView 
                                    ID="TransactionGV" 
                                    runat="server" 
                                    AutoGenerateColumns="false"
                                    CssClass="table table-bordered text-center align-middle"
                                    OnRowUpdating="TransactionGV_RowUpdating"
                                    HeaderStyle-BackColor="#f3e5f5"
                                    BorderColor="#f8bbd0"
                                    GridLines="Horizontal">
                                    <Columns>
                                        <asp:BoundField DataField="TransactionID" HeaderText="Transaction ID" />
                                        <asp:BoundField DataField="UserID" HeaderText="User ID" />
                                        <asp:BoundField DataField="TransactionDate" HeaderText="Transaction Date" />
                                        <asp:BoundField DataField="Status" HeaderText="Status" />
                                        <asp:ButtonField 
                                            CommandName="Update" 
                                            Text="Handle"
                                            ButtonType="Button"
                                            ControlStyle-CssClass="btn text-white rounded-pill px-3"
                                            ControlStyle-BackColor="#ec407a" />
                                    </Columns>
                                </asp:GridView>
                            </div>

                            <div class="text-center mt-4">
                                <asp:Button 
                                    ID="BackToHomePage" 
                                    runat="server" 
                                    Text="Back to Home Page" 
                                    CssClass="btn rounded-pill px-4 fw-semibold text-white"
                                    Style="background-color: #8e24aa; border: none;" 
                                    OnClick="BackToHomePage_Click" />
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

</body>
</html>
