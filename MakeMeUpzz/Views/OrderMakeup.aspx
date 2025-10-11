<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderMakeup.aspx.cs" Inherits="MakeMeUpzz.Views.OrderMakeup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Makeup - MakeMeUpzz</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>

<body class="bg-light" style="background: linear-gradient(135deg, #f8bbd0, #e1bee7, #f3e5f5); min-height: 100vh;">
    <form id="OrderMakeup" runat="server" class="container py-5">

        <!-- HEADER -->
        <div class="text-center mb-5">
            <h1 class="fw-bold" style="color:#8e24aa;">Order Makeup</h1>
            <hr class="mx-auto" style="width:100px; border:2px solid #ec407a; opacity:0.7;" />
        </div>

        <!-- AVAILABLE MAKEUP LIST -->
        <div class="card border-0 shadow-lg rounded-4 mb-5">
            <div class="card-header text-white text-center fw-semibold fs-5" style="background-color:#ba68c8;">
                Available Makeup
            </div>
            <div class="card-body bg-white rounded-bottom-4">
                <asp:GridView ID="OrderMakeupGV" runat="server" DataKeyNames="MakeupID"
                    AutoGenerateColumns="False" OnRowCommand="OrderMakeupGV_RowCommand"
                    CssClass="table table-hover align-middle text-center mb-0 border">
                    <Columns>
                        <asp:BoundField DataField="MakeupID" HeaderText="ID" SortExpression="MakeupID" />
                        <asp:BoundField DataField="MakeupName" HeaderText="Name" SortExpression="MakeupName" />
                        <asp:BoundField DataField="MakeupPrice" HeaderText="Price" SortExpression="MakeupPrice" />
                        <asp:BoundField DataField="MakeupWeight" HeaderText="Weight (grams)" SortExpression="MakeupWeight" />
                        <asp:TemplateField HeaderText="Input Quantity">
                            <ItemTemplate>
                                <asp:TextBox Placeholder="0" ID="QuantityTB" TextMode="Number" runat="server" CssClass="form-control text-center" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:ButtonField ButtonType="Button" CommandName="add_to_cart" Text="Add to Cart"
                            ControlStyle-CssClass="btn btn-sm text-white rounded-pill px-3"
                            ControlStyle-BackColor="#ec407a" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <!-- CART SECTION -->
        <div class="card border-0 shadow-lg rounded-4 mb-4">
            <div class="card-header text-white text-center fw-semibold fs-5" style="background-color:#ab47bc;">
                Your Cart
            </div>
            <div class="card-body bg-white rounded-bottom-4">
                <asp:GridView ID="CartGridView" runat="server" AutoGenerateColumns="False"
                    CssClass="table table-bordered align-middle text-center mb-0">
                    <Columns>
                        <asp:BoundField DataField="MakeupName" HeaderText="Makeup Name" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                    </Columns>
                </asp:GridView>

                <div class="text-center mt-4">
                    <asp:Button ID="CheckoutBtn" runat="server" Text="Checkout" OnClick="CheckoutBtn_Click"
                        CssClass="btn text-white fw-semibold rounded-pill px-4 py-2 me-2 shadow-sm"
                        style="background-color:#ec407a; border:none;" />
                    <asp:Button ID="ClearBtn" runat="server" Text="Clear Cart" OnClick="ClearBtn_Click"
                        CssClass="btn fw-semibold rounded-pill px-4 py-2 shadow-sm"
                        style="background-color:#f3e5f5; color:#8e24aa; border:none;" />
                </div>
            </div>
        </div>

        <!-- ERROR MESSAGE -->
        <div class="text-center mb-4">
            <asp:Label ID="ErrorLabel" runat="server" ForeColor="Red"
                CssClass="fw-semibold fs-6" />
        </div>

        <!-- BACK BUTTON -->
        <div class="text-center">
            <asp:Button ID="BackToHomePage" runat="server" Text="Back to Home Page" OnClick="BackToHomePage_Click"
                CssClass="btn fw-semibold rounded-pill px-4 py-2 text-white shadow-sm"
                style="background-color:#8e24aa; border:none;" />
        </div>

    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
