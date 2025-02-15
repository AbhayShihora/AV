<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Subject.aspx.cs" Inherits="Project_Attendance_System.Add_Subject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Subject</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        #form1 {
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            max-width: 450px;
            margin: auto;
        }

        h2 {
            text-align: center;
            color: #333;
        }input[type="text"] {
            width: 94.5%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

         select {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        input[type="text"]::placeholder {
            color: #aaa;
        }

        input[type="submit"] {
            background-color: #5cb85c;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #4cae4c;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Add Subject</h2>
            <asp:TextBox ID="subCode" runat="server" Placeholder="Subject Code" />
            <asp:TextBox ID="subName" runat="server" Placeholder="Subject Name" />
            <asp:DropDownList ID="faculty" runat="server">
                <asp:ListItem Value="">Select Faculty</asp:ListItem>
            </asp:DropDownList>
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
                <asp:ListItem Value="All">All</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="submitButton" runat="server" Text="Submit" OnClick="submitButton_Click" />

            <asp:Label ID="msg" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>