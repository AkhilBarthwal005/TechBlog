<%@ page import="com.tech.blog.techblog.dao.CategoryDAO" %>
<%@ page import="com.tech.blog.techblog.entity.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="com.tech.blog.techblog.helper.ConnectionProvider" %><%--
  Created by IntelliJ IDEA.
  User: Anjali Pandey
  Date: 29-07-2022
  Time: 03:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User currentUser = (User)session.getAttribute("currentUser");
    if(currentUser==null){
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%
    CategoryDAO categoryDAO = new CategoryDAO(ConnectionProvider.getConnection());
    List<Category> list = categoryDAO.getAllCategoryDetails();
%>
<html>
<head>
    <title>Post a Blog</title>
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
    <div class="main-theme zic-zack-border">
       <div class="container" style="height: 140%">
           <div class="row">
               <div class="col-md-10 offset-1">
                   <div class="card mt-4">
                       <div class="card-header main-theme text-white text-center"><h3>Add <i class="fa-solid fa-blog fa-2x"></i>log<h3></div>
                       <div class="card-body">
                           <form action="add-post" method="post" id="add-post">
                               <div class="mb-3">
                                   <select class="form-select" name="catId" aria-label="Default select example">
                                       <option selected disabled>Select Category</option>
                                       <%
                                           for (Category category:
                                                list) {
                                       %>
                                       <option value="<%=category.getCId()%>"><%=category.getName()%></option>
                                       <%
                                           }
                                       %>
                                   </select>
                               </div>
                               <div class="mb-3">
                                   <label for="title" class="form-label"><span class="me-1"><i class="fa-solid fa-highlighter"></i></span>Title</label>
                                   <input type="text" name="title" class="form-control" id="title" placeholder="Add title of Blog">
                               </div>
                               <div class="mb-3">
                                   <label for="content" class="form-label"><span class="me-1"><i class="fa-solid fa-align-justify"></i></span>Content</label>
                                   <textarea class="form-control" id="content" name="content" rows="5" cols="10" placeholder="Add your Content" style="resize: none"></textarea>
                               </div>
                               <div class="mb-3">
                                   <label for="code" class="form-label"><span class="me-1"><i class="fa-solid fa-code"></i></span>Code(if Any)</label>
                                   <textarea class="form-control" id="code" name="code" rows="5" cols="10" placeholder="Add your Code if Any" style="resize: none"></textarea>
                               </div>
                               <div class="mb-3">
                                   <label for="image" class="form-label"><span class="me-1"><i class="fa-solid fa-images"></i></span>Image</label>
                                   <input type="file" class="form-control" id="image" name="image" rows="5" cols="10" placeholder="Add an Image for a Blog" style="resize: none"/>
                               </div>
                               <div class="text-center">
                                   <button type="submit" class="btn btn-primary">Post <span class="ms-1"><i class="fa-solid fa-circle-arrow-right"></i></span></button>
                               </div>
                           </form>
                       </div>
                   </div>
               </div>
           </div>
       </div>
    </div>

    <script src="https://kit.fontawesome.com/dd3a88d1db.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function (){
            $("#add-post").on("submit",function (event){
                event.preventDefault();
                let formData = new FormData(this);
                $.ajax({
                    url : "add-post",
                    method: "post",
                    data : formData,
                    success : function (data,textStatus,jqXHR) {
                        console.log(data);
                    },
                    error : function (extStatus,jqXHR,errorThrown) {

                    },
                    processData : false,
                    contentType : false
                })
            })
        })
    </script>
</body>
</html>
