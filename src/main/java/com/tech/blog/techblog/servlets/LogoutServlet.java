package com.tech.blog.techblog.servlets;

import com.tech.blog.techblog.entity.Message;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name="LogoutServlet", value = "/logout-servlet")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        HttpSession session = req.getSession();
        session.removeAttribute("currentUser");
        Message message = new Message("Logout Successfully","success","alert-success");
        session.setAttribute("msg",message);
        resp.sendRedirect("login.jsp");
    }
}
