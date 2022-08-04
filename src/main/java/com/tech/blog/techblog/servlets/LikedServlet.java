package com.tech.blog.techblog.servlets;

import com.tech.blog.techblog.dao.LikedDAO;
import com.tech.blog.techblog.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name="LikedServlet",value = "/like")
public class LikedServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        String operation = req.getParameter("operation");
        int postId = Integer.parseInt(req.getParameter("postId"));
        int userId = Integer.parseInt(req.getParameter("userId"));

        LikedDAO likedDAO = new LikedDAO(ConnectionProvider.getConnection());
        if(operation.equals("like")){
            if(likedDAO.insertLike(postId,userId)){
                out.println("true");
            }
            else{
                out.println("Sorry ! Server issue");
            }
        }
    }
}
