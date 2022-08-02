<%@ page import="com.tech.blog.techblog.dao.PostDAO" %>
<%@ page import="com.tech.blog.techblog.helper.ConnectionProvider" %>
<%@ page import="com.tech.blog.techblog.entity.Post" %>
<%@ page import="java.util.List" %>
    <div class="row">
        <%
            PostDAO postDAO = new PostDAO(ConnectionProvider.getConnection());
            List<Post> allPost = null;
            int cId = Integer.parseInt(request.getParameter("cId"));
            if(cId == 0)
                allPost = postDAO.getAllPost();
            else
                allPost = postDAO.getAllPostByCatId(cId);

            if(allPost.size()==0){
//                out.println("<h3 class='display-3'>No Posts found in this Category</h3>");
                return;
            }

            for (Post post: allPost) {
        %>
        <div class="col-md-6 my-2">
            <div class="card">
                <img src="./PostImages/<%=post.getImage()%>" class="card-img-top" alt="post-image" height="300px" width="200px">
                <div class="card-body">
                    <h5 class="card-title"><%=post.getTitle()%></h5>
                    <p class="card-text"><%=post.getContent().substring(0,150)%>...</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
