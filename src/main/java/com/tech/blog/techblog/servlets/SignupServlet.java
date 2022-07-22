package com.tech.blog.techblog.servlets;

import com.tech.blog.techblog.dao.UserDAO;
import com.tech.blog.techblog.entity.User;
import com.tech.blog.techblog.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name="SignupServlet", value = "/signup-servlet")
@MultipartConfig
public class SignupServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        UserDAO userDAO = new UserDAO(ConnectionProvider.getConnection());

        String userName = req.getParameter("userName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");
        String gender = req.getParameter("gender");
        String terms = req.getParameter("terms");

        if(userDAO.existingUserName(userName)){
            out.println("User name must be Unique");
            return;
        }

        if(userDAO.existingUserWithEmail(email)){
            out.print("User with this email id already exist");
            return;
        }
        if(!password.equals(confirmPassword)){
            out.println("Password and Confirm Password does not match");
            return;
        }

        if(terms == null){
            out.print("You are not agree with our terms and condition");
            return;
        }
        // Creating user object.
        User user = new User(userName,email,password,confirmPassword,gender);

        // saving the user to the database.

        if(userDAO.saveUser(user)){
            out.print("user has been saved successfully");
        }
        else{
            out.print("Some error occurred while saving the user");
        }
    }
}
