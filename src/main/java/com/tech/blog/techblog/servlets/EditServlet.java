package com.tech.blog.techblog.servlets;

import com.tech.blog.techblog.dao.UserDAO;
import com.tech.blog.techblog.entity.Message;
import com.tech.blog.techblog.entity.User;
import com.tech.blog.techblog.helper.ConnectionProvider;
import com.tech.blog.techblog.helper.ProfilePhoto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
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
        boolean result = false;
        String userName = req.getParameter("userName");
        String email = req.getParameter("email");
        Part updatedProfile = req.getPart("updatedProfile");
        String updatedFileName = updatedProfile.getSubmittedFileName();

        // getting user from session
        HttpSession session = req.getSession();
        User user  = (User)session.getAttribute("currentUser");

        // Warning Message
        if(userName.equals(user.getUserName()) && email.equals(user.getEmail()) && updatedFileName.equals("")){
            Message message = new Message("You have not updated any details","warning","alert-warning");
            session.setAttribute("msg",message);
            resp.sendRedirect("index.jsp");
            return;
        }

        // setting User Details
        user.setUserName(userName);
        user.setEmail(email);
        // Profile Photo
        String path = req.getRealPath("/")+"ProfilePhoto"+ File.separator+user.getProfile();
        if(!updatedFileName.equals("")){
            user.setProfile(updatedFileName);
            ProfilePhoto.removeExistingProfilePhoto(path);
        }

        // saving updated details to the database
        UserDAO userDAO = new UserDAO(ConnectionProvider.getConnection());
        if(userDAO.UpdateUserDetails(user)){
            if(!updatedFileName.equals("")) {
                path = req.getRealPath("/") + "ProfilePhoto" + File.separator + user.getProfile();
                result = ProfilePhoto.updateProfilePhoto(updatedProfile.getInputStream(), path);
            }
//                out.println("Details Updated Successfully");
            Message message = new Message("Details Updated Successfully","success","alert-success");
            session.setAttribute("msg",message);
            resp.sendRedirect("index.jsp");
            return;
//          out.println("Details are not Updated Please try again after some time");
        }
        else{
            Message message = new Message("Sorry ! Details are not Updated Please try again after some time","error","alert-danger");
            session.setAttribute("msg",message);
            resp.sendRedirect("index.jsp");
        }

    }
}
