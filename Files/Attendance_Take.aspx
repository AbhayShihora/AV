<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Attendance_Take.aspx.cs" Inherits="Project_Attendance_System.Attendance_Tack" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       <style>
    table {
        border-collapse: collapse;
        width: 100%;
        margin-left:10%;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #6d6868;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2
    }

    h1 {
        text-align: center;
        margin-bottom: 30px;
    }
    input[type="submit"] {
        background-color: #4CAF50;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        display: block;
        margin-left:45%;
    }
    input[type="submit"]:hover {
        background-color: #3e8e41;
    }
</style>
</head>
<body>
  <form id="form1" runat="server">
    <h3>Select Students for Take Attendance..</h3>
    <asp:Table ID="tblResult" runat="server" Width="80%">
    </asp:Table><br />
    <asp:Button ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" AutoPostBack="true" CausesValidation="false" />
    <asp:Label ID="L1" runat="server" Text=""></asp:Label>
  </form>
</body>
</html>
