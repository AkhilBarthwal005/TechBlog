<%--
  Created by IntelliJ IDEA.
  User: Anjali Pandey
  Date: 20-07-2022
  Time: 07:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
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
    <main class="main-theme py-2 zic-zack-border" style="height: 115vh">
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-3">
                    <div id="spinner" class="text-center text-white" style="display:none">
                        <span><i class="fa-solid fa-arrows-rotate fa-spin fa-5x"></i></span>
                        <h3>Please Wait...</h3>
                    </div>
                    <div class="card" id="signup-card">
                        <div class="card-header text-center main-theme text-white"><span style="margin-right: 4px"><i class="fa-solid fa-user fa-solid fa-user-plus fa-2x"></i></span><h4>Sign Up</h4></div>
                        <div class="card-body">
                            <form id="signup-form" action="signup-servlet" method="post">
                                <div class="mb-3">
                                    <label for="userName" class="form-label"><span class="mx-2"><i class="fa-solid fa-user"></i></span>UserName</label>
                                    <input name="userName" type="text" class="form-control" id="userName" aria-describedby="userHelp" placeholder="UserName">
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label"><span class="mx-2"><i class="fa-solid fa-envelope"></i></span>Email address</label>
                                    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Email">
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>
                                <div class="mb-3">
                                    <label for="male" class="form-label">Gender</label>
                                    <span class="mx-2"><i class="fa-solid fa-male"></i></span><input type="radio" id="male" name="gender" value="male"> Male
                                    <span class="mx-2"><i class="fa-solid fa-female"></i></span><input type="radio" id="female" name="gender" value="female"> Female
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label"><span class="mx-2"><i class="fa-solid fa-key"></i></span>Password</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="mb-3">
                                    <label for="confirmPassword" class="form-label"><span class="mx-2"><i class="fa-solid fa-key"></i></span>Confirm Password</label>
                                    <input name="confirmPassword" type="password" class="form-control" id="confirmPassword" placeholder="Confirm Password">
                                </div>
                                <div class="mb-3 form-check">
                                    <input name="terms" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree Terms & Condition</label>
                                </div>
                                <div class="text-center">
                                <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
            <br>
        </div>
    </main>
    <%--    JavaScript--%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<%--    Sweet alert--%>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#signup-form").on('submit',function (event) {
                event.preventDefault();
                // getting all form data

                let form = new FormData(this);
                $("#signup-card").hide();
                $("#spinner").show();
                $.ajax({
                    url : "signup-servlet",
                    type : "post",
                    data : form, // we are passing form data to the signup-servlet when we click signup-from submit button.
                    success : function(data,textStatus,jqXHR){
                        console.log(data);
                    //    user has been saved successfully
                        $("#spinner").hide();
                        $("#signup-card").show();
                        if(data.trim() === "user has been saved successfully"){
                            swal(
                                'You have Successfully Registered',
                                "Click Ok to Login",
                                "success"
                            ).then((value) => {
                                window.location.href="login.jsp";
                            });
                        }
                        else{
                           swal(data,"","error");
                        }

                    },
                    error:function(textStatus,jqXHR,errorThrown){
                        $("#spinner").hide();
                        $("#signup-card").show();
                    },
                    processData : false,
                    contentType : false
                })
            })
        })
    </script>
</body>
</html>
