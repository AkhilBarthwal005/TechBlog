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
<script src="https://kit.fontawesome.com/dd3a88d1db.js" crossorigin="anonymous"></script>
</body>
</html>



