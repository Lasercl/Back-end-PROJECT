<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransactionReport.aspx.cs" Inherits="MakeMeUpzz.Views.TransactionReport" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MakeMeUpzz - Transaction Report</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>

<body style="background: linear-gradient(135deg, #f8bbd0, #e1bee7, #f3e5f5); color: #212121;">
    <form id="form1" runat="server">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <!-- Card utama -->
                    <div class="card shadow-lg border-0 rounded-4" style="background-color: #ffffff;">
                        <!-- Header -->
                        <div class="card-header text-white text-center fw-bold fs-4 rounded-top-4" style="background-color: #ab47bc;">
                            Transaction Report
                        </div>

                        <!-- Body -->
                        <div class="card-body p-4">
                            <div class="text-center mb-4">
                                <p class="text-secondary mb-0 fw-semibold" style="color: #8e24aa !important;">
                                    View and analyze your transaction summary below
                                </p>
                                <hr class="mx-auto" style="width: 80%; border-top: 3px solid #f8bbd0;" />
                            </div>

                            <!-- Crystal Report Viewer -->
                            <div class="bg-light p-3 rounded-3 border" style="border-color: #f8bbd0; background-color: #f3e5f5;">
                                <CR:CrystalReportViewer 
                                    ID="CrystalReportViewer1" 
                                    runat="server" 
                                    AutoDataBind="true"
                                    CssClass="w-100 border-0"
                                    Style="min-height: 600px;" />
                            </div>

                            <!-- Tombol Back -->
                            <div class="text-center mt-4">
                                <asp:Button 
                                    ID="BackToHomePage" 
                                    runat="server" 
                                    Text="Back to Home Page" 
                                    CssClass="btn rounded-pill px-4 py-2 fw-semibold text-white"
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
