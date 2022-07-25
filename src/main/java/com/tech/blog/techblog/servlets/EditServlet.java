package com.tech.blog.techblog.servlets;

import com.tech.blog.techblog.dao.UserDAO;
import com.tech.blog.techblog.entity.User;
import com.tech.blog.techblog.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name="EditServlet" , value = "/edit-servlet")
@MultipartConfig
public class EditServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        // getting All edit form details;
        String userName = req.getParameter("userName");
        String email = req.getParameter("email");
        Part updatedProfile = req.getPart("updatedProfile");
        String updatedFileName = updatedProfile.getSubmittedFileName();

        // getting user from session
        HttpSession session = req.getSession();
        User user  = (User)session.getAttribute("currentUser");

        // setting User Details
        user.setUserName(userName);
        user.setEmail(email);
        user.setProfile(updatedFileName);

        // saving updated details to the database
        UserDAO userDAO = new UserDAO(ConnectionProvider.getConnection());
        if(userDAO.UpdateUserDetails(user)){
            out.println("Details Updated Successfully");
        }
        else{
            out.println("Sorry ! there is an internal error please try again after some time");
        }

    }
}
