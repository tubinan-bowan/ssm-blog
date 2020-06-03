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
public class ReginsterController {

    private static Logger log = LoggerFactory.getLogger(ReginsterController.class);

    @Autowired
    UserService userService;

    @RequestMapping("register")
    @ResponseBody
    public JSONObject doPost(String name, String password) {
        log.info("register 请求start");
        log.error("register 请求 error-------");
        int result = userService.insert(name, password,null);
        String code = "1";
        String msg = "注册失败";
        if (result == 1){
            code = "0";
            msg = "注册成功";
        }
        String jsonStr = "{code:'"+code+"', msg:'"+msg+"'}";
        JSONObject jsonObject = JSON.parseObject(jsonStr);
        log.info("register 请求end");
        return jsonObject;
    }
}
