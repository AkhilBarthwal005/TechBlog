<%@ page import="com.tech.blog.techblog.dao.PostDAO" %>
<%@ page import="com.tech.blog.techblog.helper.ConnectionProvider" %>
<%@ page import="com.tech.blog.techblog.entity.Post" %>
<%@ page import="java.util.List" %>
    <div class="row">
        <%
            PostDAO postDAO = new PostDAO(ConnectionProvider.getConnection());
            List<Post> allPost = postDAO.getAllPost();
            for (Post post: allPost) {
        %>
        <div class="col-md-6 my-2">
            <div class="card">
                <img src="./PostImages/<%=post.getImage()%>" class="card-img-top" alt="post-image" height="300px" width="200px">
                <div class="card-body">
                    <h5 class="card-title"><%=post.getTitle()%></h5>
                    <p class="card-text"><%=post.getContent().substring(0,100)%>...</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
