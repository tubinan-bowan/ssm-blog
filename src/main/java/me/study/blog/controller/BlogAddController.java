package me.study.blog.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import me.study.blog.service.iml.BlogService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BlogAddController {

    private static Logger log = LoggerFactory.getLogger(BlogAddController.class);

    @Autowired
    private BlogService blogService;

    @RequestMapping("blogAdd")
    @ResponseBody
    public JSONObject blogAdd(String title, String content){
        log.info("blogAdd 请求start");
        log.error("blogAdd 请求 error-------");
        int result = blogService.insert(title, content);
        String code = "1";
        String msg = "新增失败";
        if (result == 1){
            code = "0";
            msg = "新增成功";
        }
        String jsonStr = "{code:'"+code+"', msg:'"+msg+"'}";
        JSONObject jsonObject = JSON.parseObject(jsonStr);
        log.info("blogAdd 请求end");
        return jsonObject;
    }
}
