<%@ page import="com.tech.blog.techblog.dao.PostDAO" %>
<%@ page import="com.tech.blog.techblog.helper.ConnectionProvider" %>
<%@ page import="com.tech.blog.techblog.dao.CategoryDAO" %>
<%@ page import="com.tech.blog.techblog.entity.Category" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Anjali Pandey
  Date: 01-08-2022
  Time: 01:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Posts</title>
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

<%--        show posts--%>
        <main>
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0,this)" class="c-link list-group-item list-group-item-action active" aria-current="true">All Posts</a>
                        <%
                            CategoryDAO categoryDAO = new CategoryDAO(ConnectionProvider.getConnection());
                            List<Category> allCategoryDetails = categoryDAO.getAllCategoryDetails();
                            for(Category category : allCategoryDetails){
                        %>
                            <a href="#" onclick="getPosts(<%=category.getCId()%>,this)" class="c-link list-group-item list-group-item-action"><%=category.getName()%></a>
                        <%
                            }
                        %>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div id="spinner" class="text-center" style="margin-top: 150px">
                            <span><i class="fa-solid fa-arrows-rotate fa-spin fa-5x"></i></span>
                            <h3>Please Wait...</h3>
                        </div>
                        <div id="posts">

                        </div>
                    </div>
                </div>
            </div>
        </main>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script>

        function getPosts(catId,currentRef) {
            $("#spinner").show();
            $("#posts").hide();
            $(".c-link").removeClass("active");
            $.ajax({
                url:"loadPosts.jsp",
                method:"get",
                data : {cId : catId},// sending category id to loadPosts.
                success : function (data,textStatus,jqXHR) {
                    console.log(data);
                    $(currentRef).addClass("active");
                    $("#spinner").hide();
                    $("#posts").show().html(data);
                }
            })
        }

        $(document).ready(function (){
            let initialRef = $(".c-link")[0];
            getPosts(0,initialRef);
        })
    </script>
</body>
</html>
