<%@ page import="com.tech.blog.techblog.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: Anjali Pandey
  Date: 22-07-2022
  Time: 11:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User currentUser = (User)session.getAttribute("currentUser");
    if(currentUser == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <style>
        .zic-zack-border{
            clip-path: polygon(50% 0%, 82% 0, 100% 0, 100% 89%, 100% 89%, 67% 99%, 30% 93%, 0 100%, 0 0, 24% 0);
            /*    get it from https://bennettfeely.com/clippy/*/
        }
    </style>
</head>
<body>
    <%@include file="navbar.jsp"%>

    <%--    JavaScript--%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</body>
</html>
