package me.study.blog.service;

import me.study.blog.entity.Blog;

import java.util.List;

public interface IBlogService {

    public List<Blog> getBlogList();
    public Blog getBlogById(int id);
    public int insert(String title, String content);
    public int delete(int id);
}
