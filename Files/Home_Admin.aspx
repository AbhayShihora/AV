<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home_Admin.aspx.cs" Inherits="Project_Attendance_System.Home_Admin" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Home Page Of Attendance System</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
        }
        #menubar {
            width: 20%;
            height: 100vh;
            border-right: 1px solid #000;
        }
        #attendance {
            width: 80%;
            height: 100vh;
        }
        iframe {
            width: 100%;
            height: 100%;
            border: none;
        }
    </style>
</head>
<body>
    <div id="menubar">
        <iframe src="Menubar_Admin.aspx"></iframe>
    </div>
    <div id="attendance">
        <iframe src="Manage_Teacher.aspx" name="admin"></iframe>
    </div>
</body>
</html>
