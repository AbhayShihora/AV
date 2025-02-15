<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Update_Faculty_Details.aspx.cs" Inherits="Project_Attendance_System.Files.Update_Faculty_Details" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Faculty Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #1e2a3a;
            color: white;
        }
        .container {
            width: 50%;
            margin: 50px auto;
            padding: 20px;
            background-color: #2a3b4d;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-control {
            width: 90%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            background-color: #243447;
            color: white;
        }
        .btn-submit, .btn-back {
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
        }
        .btn-submit {
            background-color: #16a085;
            color: white;
        }
        .btn-submit:hover {
            background-color: #12876f;
        }
        .btn-back {
            background-color: #7f8c8d;
            color: white;
        }
        .btn-back:hover {
            background-color: #5d6666;
        }
    </style>
</head>
<body>
    <div class="container">
        <h3>Update Faculty Details</h3>
        <form id="form1" runat="server">
            <div class="form-group">
                <asp:Label ID="lblUid" runat="server" Text="User ID"></asp:Label><br />
                <asp:TextBox ID="txtUid" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblFnm" runat="server" Text="Faculty Name"></asp:Label><br />
                <asp:TextBox ID="txtFnm" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblMo" runat="server" Text="Mobile Number"></asp:Label><br />
                <asp:TextBox ID="txtMo" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblPsw" runat="server" Text="Password"></asp:Label><br />
                <asp:TextBox ID="txtPsw" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblEmail" runat="server" Text="E-Mail"></asp:Label><br />
                <asp:TextBox ID="txtemail" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnSubmit" runat="server" Text="Update" CssClass="btn-submit" OnClick="btnSubmit_Click" />
                <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn-back" OnClick="btnBack_Click"/>
            </div>
        </form>
    </div>
</body>
</html>
