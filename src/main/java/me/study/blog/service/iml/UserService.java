package me.study.blog.service.iml;

import com.alibaba.fastjson.JSON;
import me.study.blog.controller.AdminController;
import me.study.blog.dao.UserMapper;
import me.study.blog.entity.User;
import me.study.blog.service.IUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class UserService implements IUserService {

    private static Logger log = LoggerFactory.getLogger(UserService.class);

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> getUserList() {
        List<User> userList = userMapper.getUserList();
        log.info("UserService 返回用户列表数据 {}", JSON.toJSON(userList).toString());
        return userList;
    }

    @Override
    public User getUserByName(String name) {
        User user = userMapper.getUserByName(name);
        log.info("UserService 返回用户数据 {}", JSON.toJSON(user).toString());
        return user;
    }

    @Override
    public int insert(String name, String password, String sex) {
        String gender = "男";
        if ("2".equals(sex)){
            gender = "女";
        }
        User user = new User();
        user.setName(name);
        user.setPassword(password);
        user.setSex(gender);
        int result = userMapper.insert(user);
        log.info("UserService 返回用户插入情况 {}", result);
        return result;
    }

    @Override
    public int delete(int id) {
        int result = userMapper.delete(id);
        log.info("UserService 返回用户删除情况 {}", result);
        return result;
    }

}
