<%@ page import="com.tech.blog.techblog.entity.User" %><%
    User user = (User)session.getAttribute("currentUser");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NavBar</title>
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
<nav class="navbar sticky-top navbar-expand-lg navbar-dark main-theme">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp"><span class="m-2"><i class="fa-solid fa-blog"></i></span>TechBlog</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Categories
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
                <%
                    if(user == null){
                        %>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp" tabindex="-1" aria-disabled="true"><span style="margin-right: 4px"><i class="fa-solid fa-user"></i></span>Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="signUp.jsp" tabindex="-1" aria-disabled="true"><span style="margin-right: 4px"><i class="fa-solid fa-user fa-solid fa-user-plus"></i></span>Sign up</a>
                </li>
            </ul>
            <form class="d-flex" style="margin: 0">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-light" type="submit">Search</button>
            </form>
                <%
                    }
                    else{
                %>
            </ul>
            <ul class=" navbar-nav me-right">
                <li class="nav-item">
                    <a class="nav-link" href="#" tabindex="-1" aria-disabled="true" data-bs-toggle="modal" data-bs-target="#profileModal"><span style="margin-right: 4px"><i class="fa-solid fa-user-circle"></i></span><%= user.getUserName() %></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout-servlet" tabindex="-1" aria-disabled="true"><span style="margin-right: 4px"><i class="fa-solid fa-arrow-right-from-bracket"></i></span>Logout</a>
                </li>
            </ul>
            <%
                    }
                %>
        </div>
    </div>
</nav>

<%--After login successfully--%>

<!-- Modal -->
<%
    if(user!=null){
%>
<div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header main-theme text-white">
                <h5 class="modal-title" id="exampleModalLabel">TechBlog Profile</h5>
                <button type="button" class="btn-close close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="text-center">
<%--                    Profile-photo--%>
                    <%
                        if(user.getProfile().equals("defualt.png")){
                    %>
                    <img src="./ProfilePhoto/default<%= user.getProfile()%>" class="image-fluid rounded-circle" width="100%" style="max-width: 150px">
                    <%
                        }
                        else{
                    %>
                    <img src="./ProfilePhoto/<%= user.getProfile()%>" class="image-fluid rounded-circle" width="100%" style="max-width: 150px">
                    <%
                        }
                    %>
                    <h4 class="mt-3"><%= user.getUserName()%></h4>
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
<%
    }
%>


<script src="https://kit.fontawesome.com/dd3a88d1db.js" crossorigin="anonymous"></script>
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



