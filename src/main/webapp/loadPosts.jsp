<%@ page import="com.tech.blog.techblog.dao.PostDAO" %>
<%@ page import="com.tech.blog.techblog.helper.ConnectionProvider" %>
<%@ page import="com.tech.blog.techblog.entity.Post" %>
<%@ page import="java.util.List" %>
<%@ page import="com.tech.blog.techblog.entity.User" %>
<%@ page import="com.tech.blog.techblog.dao.LikedDAO" %>
<%
    User currentUser = (User)session.getAttribute("currentUser");
    if(currentUser==null){
        response.sendRedirect("login.jsp");
        return;
    }
%>
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
                </div>
                <div class="card-footer text-center main-theme">
                    <%
                        LikedDAO likedDAO = new LikedDAO(ConnectionProvider.getConnection());
                        if(likedDAO.isPostIsLikedByUser(post.getPId(),currentUser.getId())){
                    %>
                    <a href="#" class="btn btn-outline-light disabled" onclick="doLike(<%=post.getPId()%>,<%=currentUser.getId()%>)"><i class="fa-solid fa-thumbs-up"></i> <span id="likeNumber<%=post.getPId()%>"><%=likedDAO.countLikes(post.getPId())%></span></a>
                    <%
                        }else{
                    %>
                    <a href="#" class="btn btn-outline-light" id="likeButton<%=post.getPId()%>" onclick="doLike(<%=post.getPId()%>,<%=currentUser.getId()%>)"><i class="fa-solid fa-thumbs-up"></i> <span id="likeNumber<%=post.getPId()%>"><%=likedDAO.countLikes(post.getPId())%></span></a>
                    <%
                        }
                    %>
                    <a href="showBlog.jsp?post_id=<%=post.getPId()%>" class="btn btn-outline-light">Read more...</a>
                    <a href="#" class="btn btn-outline-light text-end"><span><i class="fa-solid fa-comment-dots"></i> 20</span></a>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
