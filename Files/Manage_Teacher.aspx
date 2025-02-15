<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manage_Teacher.aspx.cs" Inherits="Project_Attendance_System.Files.Manage_Teacher" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Teachers</title>
    <style>
        /* General Page Styling */
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #1e2a3a; /* Dark Background */
            color: white;
        }
        .inline-form {
            display: inline-block;
            margin-right: 20px;
            margin-bottom: 20px;
        }

        .btn-submit {
            width: 100px;
            height: 40px;
            padding: 10px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 2px;
            cursor: pointer;
        }

        .btn-submit:hover {
            background-color: #3e8e41;
        }

        /* Container Styling */
        .container {
            width: 80%;
            margin: 50px auto;
            padding: 25px;
            background: #2a3b4d; /* Dark Card */
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        /* Heading Styling */
        h3 {
            text-align: center;
            font-size: 28px;
            font-weight: 600;
        }

        /* Table Styling */
        .table-container {
            width: 100%;
            overflow-x: auto;
            border-radius: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #243447; /* Table Background */
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 14px;
            text-align: left;
            border-bottom: 1px solid #3b4b5c;
            color: white;
        }

        th {
            background-color: #16a085; /* Header Background */
            color: white;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #1c2a3a;
        }

        tr:hover {
            background-color: #334759;
            transition: 0.3s;
        }

        /* Button Container */
        .btn-container {
            display: flex;
            gap: 70px;
            justify-content: center;
        }

        /* Buttons */
        .btn {
            border: none;
            padding: 8px 14px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.3s;
            margin-left:-60px;
        }

        .btn-update {
            background-color: #3498db; /* Blue */
            color: white;
        }

        .btn-delete {
            background-color: #e74c3c; /* Red */
            color: white;
        }

        .btn:hover {
            opacity: 0.85;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h3><u>Faculty Details</u></h3>
            <div class="table-container">
                <div class="inline-form" style="float:right;">
                    <asp:Button ID="AddFaculty" runat="server" Text="Add New Faculty" Style="width: 110%;" CssClass="btn-submit" OnClick="AddFaculty_Click1" />
                </div>
                <asp:GridView ID="gvTeachers" runat="server" AutoGenerateColumns="False"
                    CellPadding="4" GridLines="None" CssClass="table-container"
                    OnRowCommand="gvTeachers_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="uid" HeaderText="User ID" />
                        <asp:BoundField DataField="unm" HeaderText="Name" />
                        <asp:BoundField DataField="email" HeaderText="Email" />
                        <asp:BoundField DataField="mo" HeaderText="Mobile" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <div class="btn-container">
                                    <asp:Button runat="server" CssClass="btn btn-update" Text="Update" 
                                        CommandName="Update" CommandArgument='<%# Eval("Id") %>' />
                                    <asp:Button runat="server" CssClass="btn btn-delete" Text="Delete" 
                                        CommandName="Delete" CommandArgument='<%# Eval("Id") %>' 
                                        OnClientClick="return confirm('Are you sure you want to delete this record?');"/>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
