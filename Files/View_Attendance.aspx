<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View_Attendance.aspx.cs" Inherits="Project_Attendance_System.View_Attendance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Attendance</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 40px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            margin-top: 0;
        }

        .form-control {
            width: 20.2%;
            height: 30px;
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            float: left;
            margin-right: 12px;
        }
        .btn-filter {
            background-color: #4CAF50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        select {
            width: 17.5%;
            height: 52px;
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            margin-right: 10px;
            display: inline-block;
        }

        .btn-filter:hover {
            background-color: #3e8e41;
        }

        .clear {
            clear: both;
        }

        /* GridView styles */
        .gridview {
            border: 1px solid #ccc;
            border-collapse: collapse;
            width: 100%;
        }

        .gridview th {
            background-color: #f0f0f0;
            border-bottom: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }

        .gridview td {
            border-bottom: 1px solid #ccc;
            padding: 10px;
        }

        .gridview tr:hover {
            background-color: #f9f9f9;
        }

        .gridview tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Filter Attendance Data</h2>
            <asp:TextBox ID="txtRollNumber" runat="server" TextMode="Number" placeholder="Roll Number" CssClass="form-control"></asp:TextBox>
            <asp:TextBox ID="txtName" runat="server" placeholder="Name" CssClass="form-control"></asp:TextBox>
            <asp:TextBox ID="txtStartDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            <asp:TextBox ID="txtEndDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            
            <div class="clear"></div>
            <asp:DropDownList ID="ddlSubject" runat="server">
                <asp:ListItem Value="">Select Subject</asp:ListItem>
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
            </asp:DropDownList>            
             <asp:DropDownList ID="ddlSession" runat="server">
                <asp:ListItem Value="">Select Session</asp:ListItem>
                <asp:ListItem Value="1">1</asp:ListItem>
                <asp:ListItem Value="2">2</asp:ListItem>
                <asp:ListItem Value="3">3</asp:ListItem>
                <asp:ListItem Value="4">4</asp:ListItem>
                <asp:ListItem Value="5">5</asp:ListItem>
                <asp:ListItem Value="6">6</asp:ListItem>
                <asp:ListItem Value="7">7</asp:ListItem>
            </asp:DropDownList>
            <div class="clear"></div>

            <asp:Button ID="btnFilter" runat="server" Text="Filter" OnClick="btnFilter_Click" CssClass="btn-filter" />
            
            
        </div>
        <div class="container" align="center">
            <asp:GridView ID="gvAttendance" runat="server" AutoGenerateColumns="false" CssClass="gridview">
                <Columns>
                    <asp:BoundField DataField="dt" HeaderText="Date" />
                    <asp:BoundField DataField="class" HeaderText="Class" />
                    <asp:BoundField DataField="sem" HeaderText="Semester" />
                    <asp:BoundField DataField="div" HeaderText="Division" />
                    <asp:BoundField DataField="subject" HeaderText="Subject" />
                    <asp:BoundField DataField="session" HeaderText="Session" />
                    <asp:BoundField DataField="rno" HeaderText="Roll Number" />
                    <asp:BoundField DataField="snm" HeaderText="Name" />
                </Columns>
            </asp:GridView>
        </div>

    </form>
</body>
</html>