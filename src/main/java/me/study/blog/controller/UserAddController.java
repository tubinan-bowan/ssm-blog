package me.study.blog.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import me.study.blog.service.iml.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserAddController {

    private static Logger log = LoggerFactory.getLogger(UserAddController.class);

    @Autowired
    UserService userService;

    @RequestMapping("userAdd")
    @ResponseBody
    public JSONObject doPost(String name, String password, String sex){
        log.info("userAdd 请求start");
        log.error("userAdd 请求 error-------");
        int result = userService.insert(name, password, sex);
        String code = "1";
        String msg = "新增失败";
        if (result == 1){
            code = "0";
            msg = "新增成功";
        }
        String jsonStr = "{code:'"+code+"', msg:'"+msg+"'}";
        JSONObject jsonObject = JSON.parseObject(jsonStr);
        log.info("userAdd 请求end");
        return jsonObject;
    }
}
