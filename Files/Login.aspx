<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project_Attendance_System.Files.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            margin-top: 0;
        }

        a {
            display: block;
            margin: 10px 0;
        }

        form label {
            display: block;
            margin: 10px 0 5px;
        }

        form input, form button {
            width: 90%;
            padding: 8px;
            margin-bottom: 10px;
        }

    </style>
</head>
<body>
    <form id="loginForm" runat="server">
        <div class="container">
            <h2>Login for Facualty</h2>
            <asp:Label ID="lblMessage" runat="server" Text="" />
            <label for="UserId">UserId:</label>
            <asp:TextBox ID="txtUserId" runat="server" />
            <label for="password">Password:</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
            <asp:Button ID="ButtonLogin" runat="server" Text="Login" OnClick="ButtonLogin_Click1" />
        </div>
    </form>
</body>
</html>
