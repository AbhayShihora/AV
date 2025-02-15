<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manage_Student.aspx.cs" Inherits="Project_Attendance_System.Files.Manage_Student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Students</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        h3 {
            margin-left:9%;
        }
        .form-group {
            width: 90%;
            margin: 40px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .inline-form {
            display: inline-block;
            margin-right: 20px;
        }

        .form-control {
            width: 200px;
            height: 40px;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn-submit {
            width: 100px;
            height: 40px;
            padding: 10px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-submit:hover {
            background-color: #3e8e41;
        }
        .AddStudent {
            margin-left:10%;
        }
        .nostudent {
            margin-left:10%;
        }

        /* Improved GridView CSS */
        .gvStudents {
            width: 80%;
            margin: 40px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .gvStudents table {
            width: 100%;
            border-collapse: collapse;
        }

        .gvStudents th {
            width:20%;
            background-color: #f0f0f0;
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ccc;
        }

        .gvStudents td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ccc;
        }

        .gvStudents tr:hover {
            background-color: #f9f9f9;
        }
        .btnaction{
            margin-left:50px;
        }

        .gvStudents tr:nth-child(even) {
            background-color: #fff;
        }
            .gvStudents tr:nth-child(even):hover {
                background-color: #f2f2f2;
            }

        .gvStudents tr:nth-child(odd) {
            background-color: #f2f2f2;
        }
            .gvStudents tr:nth-child(odd):hover {
                background-color: #fff;
            }

        /* CSS for View, Update, and Delete buttons */
        .view-btn, .update-btn, .delete-btn {
            display: block;
            margin: 0 auto;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
        }

        .view-btn:hover {
            background-color: #3e8e41;
            width:28.5%;  
        }

        .update-btn {
            background-color: #03A9F4;
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
        }

        .update-btn:hover {
            background-color: #039BE5;
            width:37.4%;
        }

        .delete-btn {
            background-color: #FF0000;
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            align-items:center;
        }

        .delete-btn:hover {
            background-color: #CC0000;
            width:34.6%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h3>Enter given details and click on submit button for Displaying student data...</h3>
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
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn-submit" OnClick="btnSubmit_Click" />
            </div>
            
            <div class="inline-form" style="float:right;">
                <asp:Button ID="AddStudent" runat="server" Text="Add New Student" Style="width: 110%;" CssClass="btn-submit" OnClick="AddStudent_Click" />
            </div>
        </div>
        <asp:GridView ID="gvStudents" runat="server" AutoGenerateColumns="false" CssClass="gvStudents" OnRowCommand="gvStudents_RowCommand">
            <Columns>
                <asp:BoundField DataField="rno" HeaderText="Roll Number" />
                <asp:BoundField DataField="snm" HeaderText="Name" />
                <asp:TemplateField HeaderText="View Student Details">
                    <ItemTemplate>
                        <asp:Button ID="btnView" runat="server" Text="View" CssClass="view-btn" CommandName="ViewStudent" CommandArgument='<%# Eval("Id") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Update Student Details">
                    <ItemTemplate>
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="update-btn" CommandArgument='<%# Eval("Id") %>' CommandName="UpdateStudent" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete Student">
                    <ItemTemplate>
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="delete-btn" CommandArgument='<%# Eval("Id") %>' CommandName="DeleteStudent" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Label ID="txtNoStudent" CssClass="nostudent" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>