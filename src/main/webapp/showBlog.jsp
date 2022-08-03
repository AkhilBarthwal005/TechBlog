<%@ page import="com.tech.blog.techblog.dao.PostDAO" %>
<%@ page import="com.tech.blog.techblog.helper.ConnectionProvider" %>
<%@ page import="com.tech.blog.techblog.entity.Post" %>
<%@ page import="com.tech.blog.techblog.dao.UserDAO" %><%--
  Created by IntelliJ IDEA.
  User: Anjali Pandey
  Date: 02-08-2022
  Time: 03:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User currentUser = (User)session.getAttribute("currentUser");
    if(currentUser==null){
        response.sendRedirect("login.jsp");
        return;
    }
    int post_id = Integer.parseInt(request.getParameter("post_id"));
    PostDAO postDAO = new PostDAO(ConnectionProvider.getConnection());
    Post post = postDAO.getPost(post_id);
%>
<html>
<head>
    <title><%=post.getTitle()%></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <style>
        .blog-theme img{
            width: 100%;
            height: 100%;
            position: fixed;
            z-index: -1;
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <%@include file="navbar.jsp"%>
    <div class="blog-theme"><img src="./img/lightBackgroundTheme.jpg"></div>
        <div class="container">
            <div class="text-center p-2 text-white">
                <h1><%= post.getTitle()%></h1>
            </div>
            <div class="row">
                <div class="col-md-10 offset-md-1">
                    <div class="card">
                        <div class="card-header">
                            <div class="text-center">
                                <img src="./PostImages/<%=post.getImage()%>" class="img-fluid" alt="PostImage" height="500px" width="800px">
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-9">
                                    <%
                                        UserDAO userDAO = new UserDAO(ConnectionProvider.getConnection());
                                    %>
                                    <h6>posted by: <span class="text-primary"><%=userDAO.getUserByUserId(post.getUserId()).getUserName()%><span></h6>
                                </div>
                                <div class="col-md-3">
                                    <h6>Posted on : <span class="text-primary"><%= post.getPostDate().toLocaleString().substring(0,11)%></span></h6>
                                </div>
                            </div>
                            <div class="my-4">
                                <p><%=post.getContent()%></p>
                            </div>
                            <div>
                                <%
                                    if(!post.getCode().isEmpty()){
                                %>
                                <div style="margin-left: auto; width: 70%">
                                    <pre><%=post.getCode()%></pre>
                                </div>
                                <%
                                    }
                                %>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</body>
</html>
