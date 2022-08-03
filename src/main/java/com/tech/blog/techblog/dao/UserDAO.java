package com.tech.blog.techblog.dao;

import com.tech.blog.techblog.entity.User;

import java.sql.*;
import java.util.List;

public class UserDAO {
    private Connection connection;

    public UserDAO(Connection connection) {
        this.connection = connection;
    }

    public boolean saveUser(User user){
        boolean result = false;
        try{
            String query = "insert into user(userName,email,password,confirmpassword,gender) values(?,?,?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1,user.getUserName());
            preparedStatement.setString(2,user.getEmail());
            preparedStatement.setString(3,user.getPassword());
            preparedStatement.setString(4,user.getConfirmPassword());
            preparedStatement.setString(5,user.getGender());
            // saving user to database...
            int row = preparedStatement.executeUpdate();
            result = row != 0;
        }catch (SQLException exception){
            exception.printStackTrace();
        }
        return result;
    }

    public boolean existingUserName(String userName){
        boolean result = false;
        try{
            String query = "select userName from user where userName = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1,userName);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                result = true;
            }

        }catch (SQLException exception){
            exception.printStackTrace();
        }
        return result;
    }
    public boolean existingUserWithEmail(String email){
        boolean result = false;
        try{
            String query = "select email from user where email = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1,email);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                result = true;
            }

        }catch (SQLException exception){
            exception.printStackTrace();
        }
        return result;
    }

    public User getUserWithEmailAndPassword(String email, String password){
        User user = null;
        try{
            String query = "select * from user where email=? and password=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1,email);
            preparedStatement.setString(2,password);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                int id = resultSet.getInt(1);
                String userName = resultSet.getString(2);
                String emailId = resultSet.getString(3);
                String pass = resultSet.getString(4);
                String confirmPassword = resultSet.getString(5);
                String gender = resultSet.getString(6);
                Timestamp dateTime = resultSet.getTimestamp(7);
                String profile = resultSet.getString(8);
                user = new User(id,userName,emailId,pass,confirmPassword,gender,dateTime,profile);
            }
        }catch (SQLException exception){
            exception.printStackTrace();
        }
        return user;
    }

    public boolean UpdateUserDetails(User user){
        boolean result = false;
        try{
            String query = "update user set username=? , email=?, profile=? where id=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1,user.getUserName());
            preparedStatement.setString(2,user.getEmail());
            preparedStatement.setString(3,user.getProfile());
            preparedStatement.setInt(4,user.getId());
            // saving user to database...
            int row = preparedStatement.executeUpdate();
            result = row != 0;
        }catch (SQLException exception){
            exception.printStackTrace();
        }
        return result;
    }

    public User getUserByUserId(int user_id){
        User user = null;
        try{
            String query = "select * from user where id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,user_id);
            // saving user to database...
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                String userName = resultSet.getString(2);
                String email = resultSet.getString(3);
                String password = resultSet.getString(4);
                String confirmPassword = resultSet.getString(5);
                String gender = resultSet.getString(6);
                Timestamp dateTime = resultSet.getTimestamp(7);
                String profile = resultSet.getString(8);
                user = new User(user_id,userName,email,password,confirmPassword,gender,dateTime,profile);
            }
        }catch (SQLException exception){
            exception.printStackTrace();
        }
        return user;
    }
}
