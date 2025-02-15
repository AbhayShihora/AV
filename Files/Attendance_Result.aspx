<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Attendance_Result.aspx.cs" Inherits="Project_Attendance_System.Attendance_Result" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Attendance Result</title>
    <style>
        table {
            border-collapse: collapse;
            width: 75%;
            margin-left: 10%;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #337AB7;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2
        }

        h1 {
            text-align: center;
            margin-bottom: 80px;

        }

        .textbox {
            width: 200px;
            height: 30px;
            margin: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Attendance Result</h1>
        
        <asp:TextBox ID="txtdt" runat="server" Enabled="False" CssClass="textbox"></asp:TextBox>
        <asp:TextBox ID="txtclass" runat="server" Enabled="False" CssClass="textbox"></asp:TextBox>
        <asp:TextBox ID="txtsem" runat="server" Enabled="False" CssClass="textbox"></asp:TextBox>
        <asp:TextBox ID="txtdiv" runat="server" Enabled="False" CssClass="textbox"></asp:TextBox>
        <asp:TextBox ID="txtsub" runat="server" Enabled="False" CssClass="textbox"></asp:TextBox>
        <asp:TextBox ID="txtses" runat="server" Enabled="False" CssClass="textbox"></asp:TextBox>
        
        <h3>Present students are...</h3>
        <asp:Table ID="tblResult" runat="server" Width="75%">
            <asp:TableHeaderRow>
                <asp:TableHeaderCell Text="Roll Number" HorizontalAlign="Center"></asp:TableHeaderCell>
                <asp:TableHeaderCell Text="Student Name" HorizontalAlign="Center"></asp:TableHeaderCell>
            </asp:TableHeaderRow>
        </asp:Table>
        <asp:Label runat="server" Text="" ID="L1"></asp:Label>
    </form>
</body>
</html>