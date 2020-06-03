package me.study.blog.dao;

import me.study.blog.entity.Blog;

import java.util.List;

public interface BlogMapper {
    public List<Blog> getBlogList();
    public Blog getBlogById(int id);
    public int insert(Blog blog);
    public int delete(int id);
}
