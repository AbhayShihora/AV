<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menubar_Admin.aspx.cs" Inherits="Project_Attendance_System.Menubar_Admin" %>

<!DOCTYPE html>
<html>
<head>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        .container {
            font-size: 20px;
            width: 100%;
            height: 100%;
        }

        #comp {
            background-color: lightblue;
            color: white;
            height: 55px;
            padding-top: 20px;
            padding-left: 20px;
        }

        #heading {
            padding-left: 30px;
        }

        #logoa {
            padding-left: 20px;
            padding-top: 5px;
            padding-right: 12px;
            width: 15px;
            height: 15px;
        }

        a {
            color: white;
            text-decoration: none;
        }

        span {
            color: white;
            text-decoration: none;
        }

        #subnm {
            padding-top: 2%;
            padding-bottom: 3%;
            height: 30px;
            padding-left: 1%;
            font-size: 23px;
        }

        #sub1 {
            padding-top: 2%;
            height: 30px;
            padding-left: 2%;
        }

        #sub1:hover {
            background-color: #83B4FF;
            color: white;
            text-decoration: none;
            height: 30px;
        }
    </style>
</head>
<body style="background-color: #102C57;">
    <div class="container">
        <div id="comp">
            <span id="heading"><a href="#">🏠 Semcom</a></span>
        </div><br>
        <div id="subnm">
            <span><a href="#">🥷🏼 Welcome,<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Abhay Shihora</a></span>
        </div><br /><br />
        <div id="sub1">
            <a href="Manage_Teacher.aspx" target="admin">📂 Manage Teacher</a>
        </div>
        <div id="sub1">
            <a href="Manage_Subject.aspx" target="admin">📂 Manage Subject</a>
        </div>
        <div id="sub1">
            <a href="View_Attendance.aspx" target="admin">📂 View Attendance</a>
        </div>
        <div id="sub1">
            <a href="Check_Attendance.aspx" target="admin">📂 Check Attendance</a>
        </div>

    </div>
</body>
</html>
