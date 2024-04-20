<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Colorful Sidebar</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.15.4/css/all.css'>
    <link rel="stylesheet" href="/CSS/style.css">
    <link rel="stylesheet" href="/CSS/addcontact.css">
</head>
<body>

<jsp:include page="../header.jsp"/>


<div class="sidebar" id="sidebar">
    <div class="hamburger" onclick="toggleSidebar()">
        <span></span>
        <span></span>
        <span></span>
    </div>
    <ul>
        <li><a href="/home"><i class="fas fa-home"></i> Home</a></li>
        <li><a href="/user/show-contact/0"><i class="fas fa-users"></i> View Contacts</a></li>
        <li><a href="/user/add-Contact"><i class="fas fa-user-plus"></i> Add Contact</a></li>
        <li><a href="/user/profileUser"><i class="fas fa-user"></i> Your Profile</a></li>
        <li><a href="/user/profile-Update"><i class="fas fa-cog"></i> Settings</a></li>
        <li><a href="/logout"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
    </ul>
</div>


<script src="/JS/project.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
