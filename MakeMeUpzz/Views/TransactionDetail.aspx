<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransactionDetail.aspx.cs" Inherits="MakeMeUpzz.Views.TransactionDetail" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Transaction Detail - MakeMeUpzz</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>

<body style="background: linear-gradient(135deg, #f8bbd0, #e1bee7, #f3e5f5); min-height: 100vh;">
    <form id="form1" runat="server" class="container py-5">

        <!-- HEADER -->
        <div class="text-center mb-5">
            <h1 class="fw-bold" style="color:#8e24aa;">Transaction Detail</h1>
            <hr class="mx-auto" style="width:100px; border:2px solid #f8bbd0; opacity:0.8;" />
        </div>

        <!-- TRANSACTION DETAIL TABLE -->
        <div class="card border-0 shadow-lg rounded-4">
            <div class="card-header text-white text-center fw-semibold fs-5" style="background-color:#ba68c8;">
                Transaction Items
            </div>
            <div class="card-body bg-white rounded-bottom-4">
                <asp:GridView 
                    ID="TransactionDetailGV" 
                    runat="server" 
                    AutoGenerateColumns="false" 
                    CssClass="table table-hover align-middle text-center mb-0 border"
                    GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="TransactionID" HeaderText="Transaction ID" />
                        <asp:BoundField DataField="Makeup.MakeupID" HeaderText="Makeup ID" />
                        <asp:BoundField DataField="Makeup.MakeupName" HeaderText="Name" />
                        <asp:BoundField DataField="Makeup.MakeupPrice" HeaderText="Price" DataFormatString="{0:C}" HtmlEncode="false" />
                        <asp:BoundField DataField="Makeup.MakeupWeight" HeaderText="Weight (grams)" />
                        <asp:BoundField DataField="Makeup.MakeupType.MakeupTypeName" HeaderText="Type" />
                        <asp:BoundField DataField="Makeup.MakeupBrand.MakeupBrandName" HeaderText="Brand" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                        <asp:TemplateField HeaderText="Subtotal">
                            <ItemTemplate>
                                <%# GetSubtotal(Eval("Quantity"), Eval("Makeup.MakeupPrice")) %>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <!-- BUTTON SECTION -->
        <div class="text-center mt-5">
            <asp:Button 
                ID="BackToTransactionHistory" 
                runat="server" 
                Text="Back to Transaction History" 
                OnClick="BackToTransactionHistory_Click"
                CssClass="btn fw-semibold rounded-pill px-4 py-2 shadow-sm me-2"
                style="background-color:#f3e5f5; color:#8e24aa; border:none;" />

            <asp:Button 
                ID="BackToHomePage" 
                runat="server" 
                Text="Back to Home Page" 
                OnClick="BackToHomePage_Click"
                CssClass="btn text-white fw-semibold rounded-pill px-4 py-2 shadow-sm"
                style="background-color:#ec407a; border:none;" />
        </div>

    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
