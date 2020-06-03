package me.study.blog.service;

import me.study.blog.entity.User;

import java.util.List;

public interface IUserService {

    public List<User> getUserList();
    public User getUserByName(String name);
    public int insert(String name, String password, String sex);
    public int delete(int id);
}
