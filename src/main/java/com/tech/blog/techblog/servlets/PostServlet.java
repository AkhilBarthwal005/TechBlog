package com.tech.blog.techblog.servlets;

import com.tech.blog.techblog.dao.PostDAO;
import com.tech.blog.techblog.entity.Post;
import com.tech.blog.techblog.entity.User;
import com.tech.blog.techblog.helper.ConnectionProvider;
import com.tech.blog.techblog.helper.SavePostPhoto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name="PostServlet", value = "/add-post")
@MultipartConfig
public class PostServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        int cId = Integer.parseInt(req.getParameter("catId"));
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        String code = req.getParameter("code");
        Part part = req.getPart("image");
        String submittedFileName = part.getSubmittedFileName();

        // getting user
        HttpSession session = req.getSession();
        User user =  (User)session.getAttribute("currentUser");

        Post post = new Post(title,content,code,submittedFileName,cId,user.getId());

        PostDAO postDAO = new PostDAO(ConnectionProvider.getConnection());
        boolean savePost = postDAO.savePost(post);
        if(savePost){
            String path = req.getRealPath("/")+"PostImages"+File.separator+submittedFileName;
            SavePostPhoto.SavePhoto(part.getInputStream(),path);
            out.write("success");
        }
        else{
            out.write("error");
        }

    }
}
