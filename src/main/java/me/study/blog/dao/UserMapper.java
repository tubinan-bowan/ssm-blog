package me.study.blog.dao;

import me.study.blog.entity.User;

import java.util.List;

public interface UserMapper {
    public List<User> getUserList();
    public User getUserByName(String name);
    public int insert(User user);
    public int delete(int id);

}
