package com.tech.blog.techblog.helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
    private  static Connection connection;

    public static Connection getConnection(){

        try{
            if(connection==null){
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","qwerty@12345");

            }
        }catch (SQLException | ClassNotFoundException e){
            e.printStackTrace();
        }

        return connection;
    }
}
