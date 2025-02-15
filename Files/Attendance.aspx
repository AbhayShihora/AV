<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="Project_Attendance_System.Files.Attendance" %>

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
        input[type="text"], input[type="date"], input[type="number"] {
            width: 150px;
            height: 40px;
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            margin-right: 10px;
            display: inline-block;
        }

        select {
            width: 150px;
            height: 60px;
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            margin-right: 10px;
            display: inline-block;
        }
        .btn-submit {
            background-color: #4CAF50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            display: block;
        }
        .btn-submit:hover {
            background-color: #3e8e41;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top : 10%;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f0f0f0;
        }
        .file-upload-container {
            margin-bottom: 20px;
            margin-top:3%;
            display:block;
        }
        .file-upload-container input[type="file"] {
            width: 25%;
            height: 25px;
            padding: 10px;
            border: 1px solid #ccc; /* light grey border */
            border-radius: 5px;
            background-color: #f9f9f9; /* light grey background */
            font-size: medium;
        }
        .file-upload-container input[type="file"]:focus {
            border-color: #aaa; /* dark grey border on focus */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .btn-add {
            width: 15%;
            height: 40px;
            padding: 10px;
            font-size: medium;
            background-color: #888;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-add:hover {
            background-color: #777; /* darker grey background on hover */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2 style="color: #333;">Take Attendance</h2>
        <div class="file-upload-container">
            <h4>▶If you want to add Attendance from ecxel sheet then select exel file and click add from ecxel button</h4>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="UploadButton" runat="server" Text="Add from Excel" CssClass="btn-add" OnClick="UploadButton_Click" />
        </div>
        <h2>Enter Session Details</h2>
        <asp:TextBox ID="txtDate" runat="server" TextMode="Date" placeholder="Select Date"></asp:TextBox>
        <asp:DropDownList ID="ddlClass" runat="server">
            <asp:ListItem Value="">Select Class</asp:ListItem>
            <asp:ListItem Value="BCA">BCA</asp:ListItem>
            <asp:ListItem Value="BBA">BBA</asp:ListItem>
            <asp:ListItem Value="BBA-ITM">BBA-ITM</asp:ListItem>
            <asp:ListItem Value="BCOM">BCOM</asp:ListItem>
            <asp:ListItem Value="MCOM">MCOM</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="ddlSem" runat="server">
            <asp:ListItem Value="">Select Semester</asp:ListItem>
            <asp:ListItem Value="1">1</asp:ListItem>
            <asp:ListItem Value="2">2</asp:ListItem>
            <asp:ListItem Value="3">3</asp:ListItem>
            <asp:ListItem Value="4">4</asp:ListItem>
            <asp:ListItem Value="5">5</asp:ListItem>
            <asp:ListItem Value="6">6</asp:ListItem>
            <asp:ListItem Value="7">7</asp:ListItem>
            <asp:ListItem Value="8">8</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="ddlDivision" runat="server">
            <asp:ListItem Value="">Select Division</asp:ListItem>
            <asp:ListItem Value="A">A</asp:ListItem>
            <asp:ListItem Value="B">B</asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="txtSubject" runat="server" placeholder="Enter Subject"></asp:TextBox>
        <asp:TextBox ID="txtSession" runat="server" TextMode="Number" placeholder="Enter Session"></asp:TextBox>
        <br />
        <asp:Button ID="btnSubmit" type="submit" runat="server" CssClass="btn-submit" Text="Get Students" OnClick="btnSubmit_Click" />
        <br />
        
        <asp:Table ID="tblResult" runat="server" Width="100%">
        </asp:Table>
        <asp:Label runat="server" Text="" ID="L1"></asp:Label>
    </form>
</body>
</html>