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
}
