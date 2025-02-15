<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Teacher.aspx.cs" Inherits="Project_Attendance_System.Files.Add_Teacher" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Faculty</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
        }
        .container {
            width: 50%;
            margin: 25px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group input[type="text"], 
        .form-group input[type="password"], 
        .form-group input[type="number"], 
        .form-group input[type="Email"] {
            width: 95%;
            height: 30px;
            padding: 7px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .btn-submit {
            width: 100%;
            height: 40px;
            font-size: medium;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-submit:hover {
            background-color: #218838;
        }
        .btn-back {
            width: 100px;
            height: 40px;
            background-color: #dc3545;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-back:hover {
            background-color: #c82333;
        }
        .message {
            color: green;
            font-size: 16px;
            margin-top: 10px;
        }
        .error-message {
            color: red;
            font-size: 16px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn-back" OnClick="btnBack_Click" />
            <h2>Add Faculty</h2>

            <div class="form-group">
                <asp:TextBox ID="txtUid" runat="server" placeholder="User ID" required="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtName" runat="server" placeholder="Faculty Name" required="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" TextMode="Password" required="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtMobile" runat="server" placeholder="Mobile Number" TextMode="Number" required="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtEmail" runat="server" placeholder="E-Mail" TextMode="Email" required="true"></asp:TextBox>
            </div>

            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn-submit" OnClick="btnSubmit_Click" />
            <br />
            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
            <asp:Label ID="lblErrorMessage" runat="server" CssClass="error-message"></asp:Label>
        </div>
    </form>
</body>
</html>

