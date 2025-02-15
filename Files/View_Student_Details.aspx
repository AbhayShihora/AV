<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View_Student_Details.aspx.cs" Inherits="Project_Attendance_System.Files.View_Student_Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Student Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        table {
            width: 70%;
            margin: 40px auto;
            padding: 30px;
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            border-radius: 10px;
            border-width:medium;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            font-size:.7cm;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-width:revert;
            border-bottom: 1px solid #ccc;
        }
        th {
            background-color: #f0f0f0;
        }
        h2 {
            margin-left: 10%;
        }
        .btn-back {
            width:10%;
            height: 45px;
            font-size:.7cm;
            background-color: #4CAF50;
            color: #fff;
            border: groove;
            border-radius: 5px;
            cursor: pointer;
            margin-left:10%;
        }
        .btn-back:hover {
            background-color: #3e8e41; /* darker grey background on hover */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <br /><br />
        <asp:Button ID="back" runat="server" Text="Back" CssClass="btn-back" OnClick="back_Click" />
        <div>
            <h2>Student Details</h2>
            <table>
                <tr>
                    <td align="right">Roll Number:</td>
                    <td><asp:Label ID="lblRollNumber" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><asp:Label ID="lblName" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Class:</td>
                    <td><asp:Label ID="lblClass" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Semester:</td>
                    <td><asp:Label ID="lblSemester" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Division:</td>
                    <td><asp:Label ID="lblDivision" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Mobile Number:</td>
                    <td><asp:Label ID="lblMobileNumber" runat="server" Text=""></asp:Label></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>