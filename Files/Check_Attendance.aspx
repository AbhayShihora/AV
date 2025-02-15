<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Check_Attendance.aspx.cs" Inherits="Project_Attendance_System.Files.Check_Attendance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Check Attendance</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-control {
            width: 100%;
            height: 40px;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
        }
        .form-control_tb {
            width: 99%;
            height: 20px;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
        }
        .btn-submit {
            background-color: #4CAF50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-submit:hover {
            background-color: #3e8e41;
        }
        .lbl-info {
            width:20%;
            margin-right:10%;
            margin-left:8%;
        }
        .dis-info {
            padding: 10px;
            font-size: 20px;
        }
        .buttonp {
            margin-top:5%;
            margin-left:420%;
            background-color: #808080;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer; 
        }
        .buttonp:hover {
            margin-top:5%;
            margin-left:420%;
            background-color: #333;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer; 
        }
        .grid-view {
            margin-top: 20px;
        }
        .grid-view {
            margin-top: 20px;
            overflow-x: auto;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .table th, .table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        .thead-dark {
            background-color: #333;
            color: #fff;
        }

        .table-striped tbody tr:nth-child(even) {
            background-color: #f5f5f5;
        }

        .table-bordered {
            border: 1px solid #ddd;
        }

        .table-bordered th, .table-bordered td {
            border: 1px solid #ddd;
        }
        .inline-form {
            display: inline-block;
            margin-right: 20px;
        }
    </style>
    <script>
        function abc() {
        var printContent = document.getElementById('grid-view');
        var WinPrint = window.open('', '', 'width=888,height=700');
        WinPrint.document.write('<html><head><title>Student Attendance Details</title>');
        WinPrint.document.write('<style>body{font-family:Arial, sans-serif;} table{border-collapse:collapse; width:100%;} table, th, td{border:1px solid black; padding:8px;} th{text-align:left;}</style>');
        WinPrint.document.write('</head><body>');
        WinPrint.document.write(printContent.innerHTML);
        WinPrint.document.write('</body></html>');
        WinPrint.document.close();
        WinPrint.focus();
        WinPrint.print();
        WinPrint.close();
    }
    </script>
</head>
<body>
    <div class="container">
        <h2>Check Attendance</h2>
        <form id="form1" runat="server">
            <div class="form-group">
                <div class="inline-form">
                    <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">Select Course</asp:ListItem>
                        <asp:ListItem Value="BCA">BCA</asp:ListItem>
                        <asp:ListItem Value="BCOM">BCOM</asp:ListItem>
                        <asp:ListItem Value="BBA">BBA</asp:ListItem>
                        <asp:ListItem Value="BBA-ITM">BBA-ITM</asp:ListItem>
                        <asp:ListItem Value="MCOM">MCOM</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="inline-form">
                    <asp:DropDownList ID="ddlSemester" runat="server" CssClass="form-control">
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
                </div>
                <div class="inline-form">
                    <asp:DropDownList ID="ddlDivision" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">Select Division</asp:ListItem>
                        <asp:ListItem Value="A">A</asp:ListItem>
                        <asp:ListItem Value="B">B</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="inline-form">
                    <asp:TextBox ID="txtTotalSessions" runat="server" placeholder="Enter Total Session Number" CssClass="form-control_tb" type="number"></asp:TextBox>
                </div>
                <div class="inline-form">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn-submit" OnClick="btnSubmit_Click" />
                </div>
                 <div class="inline-form">
                     <button type="submit" onclick="abc();" class="buttonp">Generate PDF</button>
                 </div>
            </div>
            <div class="grid-view" id="grid-view">
                
                    <div class="dis-info">
                        <asp:Label ID="lblClass" CssClass="lbl-info" runat="server" Text=""></asp:Label> 
                        <asp:Label ID="lblSem"  CssClass="lbl-info" runat="server" Text=""></asp:Label> 
                        <asp:Label ID="lblDiv" runat="server"  CssClass="lbl-info" Text=""></asp:Label> 
                    </div>
                    <asp:GridView ID="gvAttendance" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered" OnRowDataBound="gvAttendance_RowDataBound">
                    <HeaderStyle CssClass="thead-dark" />
                    <Columns>
                        <asp:BoundField DataField="rno" HeaderText="Roll Number" ItemStyle-Width="15%" />
                        <asp:BoundField DataField="snm" HeaderText="Student Name" ItemStyle-Width="30%" />
                        <asp:BoundField DataField="AttendedSessions" HeaderText="Attended Sessions" ItemStyle-Width="15%" />
                        <asp:BoundField DataField="totalSessions" HeaderText="Total Sessions" ItemStyle-Width="15%" />
                        <asp:BoundField DataField="AttendancePercentage" HeaderText="Attendance Percentage" ItemStyle-Width="25%" />
                    </Columns>
                </asp:GridView>
            </div>
    </form>
</div>
</body>
</html>