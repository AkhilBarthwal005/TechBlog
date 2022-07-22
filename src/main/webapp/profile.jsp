<%@ page import="com.tech.blog.techblog.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: Anjali Pandey
  Date: 22-07-2022
  Time: 11:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user = (User)session.getAttribute("currentUser");
    if(user == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Profile</title>
</head>
<body>
    <h1>Profile page</h1>
    <%= user.getUserName() %>
    <%= user.getEmail() %>
    <%= user.getGender() %>
</body>
</html>
