<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Update_Student_Details.aspx.cs" Inherits="Project_Attendance_System.Files.Update_Student_Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Student Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }
        .container {
            width: 70%;
            margin: 20px auto;
            padding: 5px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 10px;
        }
        .form-control {
            margin-left:4%;
            width: 90%;
            height: 20px;
            padding: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-control1 {
            margin-left:4%;
        }
        .btn-submit {
            width: 100px;
            height: 40px;
            padding: 10px;
            margin-left:4%;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-submit:hover {
            background-color: #3e8e41;
        }
        .btn-back {
            width: 100px;
            height: 40px;
            padding: 10px;
            background-color: #ccc;
            color: #333;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-back:hover {
            background-color: #aaa;
        }
    </style>
</head>
<body>
    <div class="container">
        <h3>Update Student Details</h3>
        <form id="form1" runat="server">
            <div class="form-group">
                <asp:Label ID="lblRno" runat="server" Text="Roll Number" CssClass="form-control1"></asp:Label><br />
                <asp:TextBox ID="txtRno" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblSnm" runat="server" Text="Name" CssClass="form-control1"></asp:Label><br />
                <asp:TextBox ID="txtSnm" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblClass" runat="server" Text="Class" CssClass="form-control1"></asp:Label><br />
                <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control">
                    <asp:ListItem Value="">Select Course</asp:ListItem>
                    <asp:ListItem Value="BCA">BCA</asp:ListItem>
                    <asp:ListItem Value="BCOM">BCOM</asp:ListItem>
                    <asp:ListItem Value="BBA">BBA</asp:ListItem>
                    <asp:ListItem Value="BBA-ITM">BBA-ITM</asp:ListItem>
                    <asp:ListItem Value="MCOM">MCOM</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Label ID="lblSem" runat="server" Text="Semester" CssClass="form-control1"></asp:Label><br />
                <asp:TextBox ID="txtSem" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblDiv" runat="server" Text="Division" CssClass="form-control1"></asp:Label><br />
                <asp:TextBox ID="txtDiv" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblMno" runat="server" Text="Mobile Number" CssClass="form-control1"></asp:Label><br />
                <asp:TextBox ID="txtMno" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn-submit" OnClick="btnSubmit_Click" />
                <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn-back" OnClick="btnBack_Click" />
            </div>
        </form>
    </div>
</body>
</html>