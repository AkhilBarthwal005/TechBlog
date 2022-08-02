<%@ page import="java.sql.*" %>
<%@ page import="com.tech.blog.techblog.helper.ConnectionProvider" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.tech.blog.techblog.helper.Message" %>
<%@ page import="com.tech.blog.techblog.dao.CategoryDAO" %>
<%@ page import="com.tech.blog.techblog.entity.Category" %>
<%@ page import="java.util.List" %>

<%
    User currentUser = (User)session.getAttribute("currentUser");
%>

<!DOCTYPE html>
<html>
<head>
    <title>TechBlog</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <style>
        .zic-zack-border{
            clip-path: polygon(50% 0%, 82% 0, 100% 0, 100% 89%, 100% 89%, 67% 99%, 30% 93%, 0 100%, 0 0, 24% 0);
        /*    get it from https://bennettfeely.com/clippy/*/
        }
    </style>
</head>
<body>
<%--    NavBar--%>
    <%@include file="navbar.jsp"%>
<%--                   alert Message--%>
<%
    Message msg = (Message) session.getAttribute("msg");
    if(msg!=null){ %>

<div class="alert <%= msg.getCssClass()%> alert-dismissible fade show" role="alert" style="margin-bottom: 0">
    <%=msg.getContent()%>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>

<%
        session.removeAttribute("msg");
    }
%>
    <div class="container-fluid p-0 m-0 zic-zack-border">
        <section class="py-3 main-theme text-white">
            <div class="container">
                <h1 class="display-3">Welcome to Tech Blog</h1>
                <p>Welcome to Technical Blog, World of Technology</p>
                <p>Technology is the result of accumulated knowledge and application of skills, methods, and processes used in industrial production and scientific research. Technology is embedded in the operation of all machines, with or without detailed knowledge of their function, for the intended purpose of an organization. The technologies of society consist of what is known as systems. Systems operate by obtaining an input, altering this input through what is known as a process, and then producing an outcome that achieves the intended purpose of the system.</p>
                <%
                    if(currentUser == null){
                %>
                <a href="signUp.jsp" class="btn btn-outline-light btn-lg m-2"><span class="mx-2"><i class="fa-solid fa-user-plus"></i></span>Start ! Free</a>
                <a href="login.jsp" class="btn btn-outline-light btn-lg"><span class="mx-2"><i class="fa-solid fa-user fa-spin"></i></span>Login</a>
                <%
                    }
                %>
            </div>
            <br>
        </section>
    </div>

<%--    Cards--%>
    <div class="container mt-3">
<%--        Fetching categories from database--%>
        <%
            CategoryDAO categoryDAO = new CategoryDAO(ConnectionProvider.getConnection());
            List<Category> categories = categoryDAO.getAllCategoryDetails();
        %>
        <div class="row my-4">
            <%
                for(Category category : categories){

            %>
            <div class="col-md-4 my-2">
                <div class="card" style="width: 18rem;">
                    <img src="./img/categoriesImages/<%=category.getImage()%>" class="card-img-top" alt="..." height="250px" width="300px">
                    <div class="card-body">
                        <h5 class="card-title"><%=category.getName()%></h5>
                        <p class="card-text"><%=category.getDescription().substring(0,142)%>...</p>
                        <a href="#" class="btn main-theme text-white">Read more</a>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>
<%--    JavaScript--%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</body>
</html>