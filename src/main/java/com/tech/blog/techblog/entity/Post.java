package com.tech.blog.techblog.entity;

public class Post {
    private int pId;
    private String title;
    private String content;
    private String code;
    private String image;
    private String postDate;
    private int catId;
    private int userId;

    public Post() {
    }

    public Post(int pId, String title, String content, String code, String image, String postDate, int catId, int userId) {
        this.pId = pId;
        this.title = title;
        this.content = content;
        this.code = code;
        this.image = image;
        this.postDate = postDate;
        this.catId = catId;
        this.userId = userId;
    }

    public Post(String title, String content, String code, String image, String postDate, int catId, int userId) {
        this.title = title;
        this.content = content;
        this.code = code;
        this.image = image;
        this.postDate = postDate;
        this.catId = catId;
        this.userId = userId;
    }

    public int getPId() {
        return pId;
    }

    public void setPId(int pId) {
        this.pId = pId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getPostDate() {
        return postDate;
    }

    public void setPostDate(String postDate) {
        this.postDate = postDate;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
