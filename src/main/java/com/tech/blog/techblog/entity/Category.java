package com.tech.blog.techblog.entity;

public class Category {
    private int cId;
    private String name;
    private String description;
    private  String image;

    public Category() {
    }

    public Category(int cId, String name, String description,String image) {
        this.cId = cId;
        this.name = name;
        this.description = description;
        this.image = image;
    }

    public Category(String name, String description,String image) {
        this.name = name;
        this.description = description;
        this.image = image;
    }

    public int getCId() {
        return cId;
    }

    public void setCId(int cId) {
        this.cId = cId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
