<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addstud.aspx.cs" Inherits="Project_Attendance_System.addstud" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Student</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7; /* light grey background */
        }
        .container {
            width: 50%;
            margin: 25px auto;
            padding: 20px;
            background-color: #fff; /* white background */
            border: 1px solid #ddd; /* light grey border */
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group input[type="text"], .form-group input[type="number"] {
            width: 95%;
            height: 25px;
            padding: 7px;
            border: 1px solid #ccc; /* light grey border */
            border-radius: 5px;
            background-color: #f9f9f9; /* light grey background */
        }
        .form-group input[type="text"]:focus, .form-group input[type="number"]:focus {
            border-color: #aaa; /* dark grey border on focus */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        select {
            width: 97.5%;
            height: 40px;
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-right: 10px;
        }

        .btn-submit {
            width: 95%;
            height: 40px;
            font-size:medium;
            background-color: #666; /* dark grey background */
            color: #fff; /* white text */
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-submit:hover {
            background-color: #555; /* darker grey background on hover */
        }
        .btn-back {
            width:12%;
            height: 40px;
            padding: 10px;
            font-size:medium;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-back:hover {
            background-color: #3e8e41; /* darker grey background on hover */
        }
        .file-upload-container {
            margin-bottom: 20px;
        }
        .file-upload-container input[type="file"] {
            width: 60%;
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
            width: 23%;
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
        <div class="container">
            <asp:Button ID="back" runat="server" Text="Back" CssClass="btn-back" OnClick="back_Click" />
            <h2 style="color: #333;">Add Student</h2>
            <div class="file-upload-container">
                <h4>▶If you want to add student from ecxel sheet then select exel file and click add from ecxel button</h4>
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:Button ID="UploadButton" runat="server" Text="Add from Excel" CssClass="btn-add" OnClick="UploadButton_Click" />
            </div>
            <h3>Enter Student Details </h3>
            <div class="form-group">
                <asp:TextBox ID="rollNumber" runat="server" type="number" placeholder="Roll Number"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="studentName" runat="server" type="text" placeholder="Student Name"></asp:TextBox>
            </div>
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
                <asp:ListItem Value="C">C</asp:ListItem>
            </asp:DropDownList>
            <div class="form-group">
                <asp:TextBox ID="mobileNumber" runat="server" type="number" placeholder="Mobile Number"></asp:TextBox>
            </div>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn-submit" OnClick="btnSubmit_Click" />
        </div>
    </form>
</body>
</html>