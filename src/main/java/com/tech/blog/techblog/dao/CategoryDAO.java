package com.tech.blog.techblog.dao;

import com.tech.blog.techblog.entity.Category;
import com.tech.blog.techblog.helper.ConnectionProvider;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
    private Connection connection;

    public CategoryDAO(Connection connection){
        this.connection = connection;
    }

    public List<Category> getAllCategoryDetails(){
        List<Category> categories = new ArrayList<>();
        try{
            String query = "Select * from category";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            while(resultSet.next()){
                int cId = resultSet.getInt(1);
                String name = resultSet.getString(2);
                String description = resultSet.getString(3);
                String image = resultSet.getString(4);
                Category category = new Category(cId,name,description,image);
                categories.add(category);
            }
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return  categories;
    }
}
