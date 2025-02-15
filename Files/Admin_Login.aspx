<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Login.aspx.cs" Inherits="Project_Attendance_System.Files.Admin_Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e9ecef;
            color: #495057;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
        }

        h2 {
            margin-top: 0;
            color: #5cb85c;
            font-weight: 600;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        form input {
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ced4da;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        form input:focus {
            border-color: #5cb85c;
            outline: none;
        }

        form input[type="submit"] {
            background-color: #5cb85c;
            color: white;
            border: none;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        form input[type="submit"]:hover {
            background-color: #4cae4c;
        }

        .message {
            color: #dc3545;
            margin-top: 10px;
            font-size: 14px;
        }

        .footer {
            margin-top: 20px;
            font-size: 14px;
            color: #6c757d;
        }

        .footer a {
            color: #5cb85c;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="loginForm" runat="server">
        <div class="container">
            <h2>Login for Faculty</h2>
            <asp:Label ID="lblMessage" runat="server" CssClass="message" Text="" />
            <asp:TextBox ID="txtUserName" runat="server" Placeholder="User  Id" />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Placeholder="Password" /><br />
            <asp:Button ID="ButtonLogin" runat="server" Text="Login"  />
            <div class="footer">
                <p><a href="#">Forgot Password?</a></p>
            </div>
        </div>
    </form>
</body>
</html>