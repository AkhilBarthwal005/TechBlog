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
    <!-- Modal -->
    <div class="modal fade" id="ProfileModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header main-theme text-white">
                    <h5 class="modal-title" id="exampleModalLabel">TechBlog Profile</h5>
                    <button type="button" class="btn-close close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="text-center">
                        <img src="./ProfilePhoto/<%= currentUser.getProfile()%>" class="image-fluid rounded-circle" width="100%" style="max-width: 150px">
                        <h4 class="mt-3"><%= currentUser.getUserName()%></h4>
                    </div>
<%--                    Profile Details--%>
                    <div class="container" id="profile-details">
                        <table class="table table-hover">
                            <tr>
                                <th>Id:</th>
                                <td><%=user.getId()%></td>
                            </tr>
                            <tr>
                                <th>Email Id:</th>
                                <td><%=user.getEmail()%></td>
                            </tr>
                            <tr>
                                <th>Gender:</th>
                                <td><%=user.getGender()%></td>
                            </tr>
                            <tr>
                                <th>Register on:</th>
                                <td><%=user.getDatetime()%></td>
                            </tr>
                        </table>
                    </div>
<%--                    End of Profile Details--%>

<%--                    Profile Edit --%>
                    <div class="container" id="profile-edit" style="display: none">
                        <h3 class="text-center">Please Edit Carefully</h3>
<%--                        enctype help in sending image by form to servlet--%>
                        <form action="edit-servlet" method="post" enctype="multipart/form-data">
                            <table class="table table-hover">
                                <tr>
                                    <th>Id:</th>
                                    <td><%=user.getId()%></td>
                                </tr>
                                <tr>
                                    <th>User Name:</th>
                                    <td><input type="text" class="form-control" name="userName" value="<%=user.getUserName()%>"></td>
                                </tr>
                                <tr>
                                    <th>Email Id:</th>
                                    <td><input type="email" class="form-control" name="email" value="<%=user.getEmail()%>"></td>
                                </tr>
                                <tr>
                                    <th>Gender:</th>
                                    <td><%=user.getGender().toUpperCase()%></td>
                                </tr>
                                <tr>
                                    <th>Update Profile:</th>
                                    <td><input type="file" class="form-control" name="updatedProfile"></td>
                                </tr>
                            </table>
                            <div class="text-center">
                                <button type="submit" class="btn btn-outline-primary">Save</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="edit-button">Edit</button>
                    <button type="button" class="btn btn-secondary close" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <%--    JavaScript--%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <script>
        $(document).ready(function (){
            let flag = false;
            $("#edit-button").on('click',function (){
                if(!flag){
                    $("#profile-details").hide();
                    $("#profile-edit").show();
                    $("#edit-button").text("Back");
                    flag = true;
                }
                else{
                    $("#profile-edit").hide();
                    $("#profile-details").show();
                    $("#edit-button").text("Edit");
                    flag = false;
                }
            })

            $(".close").on('click',function(){
                $("#profile-edit").hide();
                $("#profile-details").show();
                $("#edit-button").text("Edit");
                flag = false;
            })
        })
    </script>
</body>
</html>
