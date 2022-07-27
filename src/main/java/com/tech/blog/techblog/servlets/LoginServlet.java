package com.tech.blog.techblog.servlets;

import com.tech.blog.techblog.dao.UserDAO;
import com.tech.blog.techblog.helper.Message;
import com.tech.blog.techblog.entity.User;
import com.tech.blog.techblog.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name="LoginServlet", value = "/login-servlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        UserDAO userDAO = new UserDAO(ConnectionProvider.getConnection());
        User user = userDAO.getUserWithEmailAndPassword(email, password);
//        getting session
        HttpSession session = req.getSession();

        if(user == null){
//            out.println("Invalid Credential");
            Message message = new Message("Invalid Credential","error","alert-danger");
            session.setAttribute("msg",message);
            resp.sendRedirect("login.jsp");
            return;
        }
        Message message = new Message("Login Successfully","success","alert-success");
        session.setAttribute("msg",message);
        session.setAttribute("currentUser",user);
        resp.sendRedirect("index.jsp");

    }
}
