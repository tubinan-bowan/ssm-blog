package me.study.blog.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import me.study.blog.entity.User;
import me.study.blog.service.iml.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("userList")
public class UserListController {

    private static Logger log = LoggerFactory.getLogger(UserListController.class);

    @Autowired
    UserService userService;

    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public JSONObject deleteGet(Integer id) {
        log.info("userList GET 请求start");
        log.error("userList GET 请求 error-------");
        int result = userService.delete(id);
        String jsonStr = null;
        if (result == 1){
            jsonStr = "{code:'0', msg:'删除成功'}";
            JSONObject jsonObject = JSON.parseObject(jsonStr);
            log.info("userList GET  查询用户，返回信息 {}", jsonObject);
            log.info("userList GET 请求end");
            return jsonObject;
        }else{
            jsonStr = "{code:'0', msg:'删除失败'}";
            JSONObject jsonObject = JSON.parseObject(jsonStr);
            log.info("userList GET  查询用户，返回信息 {}", jsonObject);
            log.info("userList GET 请求end");
            return jsonObject;
        }
    }
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public JSONObject doPost() {
        log.info("userList POST 请求start");
        log.error("userList POST 请求 error-------");
        List<User> userList = userService.getUserList();
        String strj = JSON.toJSON(userList).toString();
        String jsonStr = "{code:'0', msg:'查询成功', data:"+strj+"}";//{code:'0', msg:'查询成功', data:'strj'}
        JSONObject jsonObject = JSON.parseObject(jsonStr);
        log.info("userList POST 查询用户，返回信息 {}", jsonObject);
        log.info("userList POST 请求end");
        return jsonObject;
    }
}
