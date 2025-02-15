<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="try.aspx.cs" Inherits="Project_Attendance_System._try" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Input Form</title>
    <style>

    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
    }
    form {
        width: 90%;
        margin: 40px auto;
        padding: 20px;
        background-color: #fff;
        border: 1px solid #ddd;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    table {
        border-collapse: collapse;
        width: 100%;
}
    th, td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: left;
    }
    th {
        background-color: #f0f0f0;
    }
    input[type="submit"] {
        background-color: #4CAF50;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        display: block;
    }
input[type="submit"]:hover {
    background-color: #3e8e41;
}
        button {
            color:black;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Table ID="tblResult" runat="server" Width="100%">
    </asp:Table>
    <asp:Button ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" AutoPostBack="true" CausesValidation="false" />jhfhdhfh
        <asp:Button runat="server" Text="Button" BackColor="Blue"></asp:Button>
    <asp:Label ID="L1" runat="server" Text="Label"></asp:Label>
</form>


</body>
</html>