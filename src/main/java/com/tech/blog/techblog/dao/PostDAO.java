package com.tech.blog.techblog.dao;

import com.tech.blog.techblog.entity.Category;
import com.tech.blog.techblog.entity.Post;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDAO {
    private Connection connection;

    public PostDAO(Connection connection){
        this.connection = connection;
    }

    public boolean savePost(Post post){
        boolean result = false;
        try{
            String query = "insert into post (title,content,code,image,catId,userId) values(?,?,?,?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1,post.getTitle());
            preparedStatement.setString(2,post.getContent());
            preparedStatement.setString(3,post.getCode());
            preparedStatement.setString(4,post.getImage());
            preparedStatement.setInt(5,post.getCatId());
            preparedStatement.setInt(6,post.getUserId());
            int row = preparedStatement.executeUpdate();
            result = row!=0;
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return  result;
    }

    public List<Post> getAllPost(){
        List<Post> posts = new ArrayList<>();
        try{
            String query = "select * from post order by pId desc";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            while(resultSet.next()){
                int pId = resultSet.getInt(1);
                String title = resultSet.getString(2);
                String content = resultSet.getString(3);
                String code = resultSet.getString(4);
                String image = resultSet.getString(5);
                Timestamp postDate = resultSet.getTimestamp(6);
                int catId = resultSet.getInt(7);
                int userId = resultSet.getInt(8);
                Post post = new Post(pId,title,content,code,image,postDate,catId,userId);
                posts.add(post);
            }
        }
         catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return  posts;
    }

    public List<Post> getAllPostByCatId(int cId){
        List<Post> posts = new ArrayList<>();
        try{
            String query = "select * from post where catId=? order by pId desc";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,cId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                int pId = resultSet.getInt(1);
                String title = resultSet.getString(2);
                String content = resultSet.getString(3);
                String code = resultSet.getString(4);
                String image = resultSet.getString(5);
                Timestamp postDate = resultSet.getTimestamp(6);
                int catId = resultSet.getInt(7);
                int userId = resultSet.getInt(8);
                Post post = new Post(pId,title,content,code,image,postDate,catId,userId);
                posts.add(post);
            }
        }
         catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return  posts;
    }
}
