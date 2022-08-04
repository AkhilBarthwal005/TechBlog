package com.tech.blog.techblog.dao;


import java.sql.*;

public class LikedDAO {
    private Connection connection;

    public LikedDAO(Connection connection){
        this.connection = connection;
    }

    public boolean insertLike(int postId, int userId){
        boolean result = false;
        try{
            String query = "insert into liked(postId,userId) values(?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,postId);
            preparedStatement.setInt(2,userId);
            int row = preparedStatement.executeUpdate();
            result = row !=0;
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return  result;
    }

    public int countLikes(int postId){
        int count = 0;
        try{
            String query = "select count(*) from liked where postId=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,postId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                count = resultSet.getInt(1);
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return  count;
    }

    public boolean isPostIsLikedByUser(int postId, int userId){
        boolean result = false;
        try{
            String query = "select * from liked where postId=? and userId=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,postId);
            preparedStatement.setInt(2,userId);
            int row = preparedStatement.executeUpdate();
            result = row !=0;
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return  result;
    }

    public boolean deleteLike(int postId, int userId){
        boolean result = false;
        try{
            String query = "delete from liked where postId=? and userId=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,postId);
            preparedStatement.setInt(2,userId);
            int row = preparedStatement.executeUpdate();
            result = row !=0;
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return  result;
    }
}
