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
public class BlogDeleteController {

    private static Logger log = LoggerFactory.getLogger(BlogDeleteController.class);

    @Autowired
    private BlogService blogService;

    @RequestMapping("blogDelete")
    @ResponseBody
    public JSONObject blogDelete(Integer id) {
        log.info("blogDelete 请求start");
        log.error("blogDelete 请求 error-------");
        int result = blogService.delete(id);
        String jsonStr = null;
        if (result == 1) {
            jsonStr = "{code:'0', msg:'删除成功'}";
        }else {
            jsonStr = "{code:'0', msg:'删除成功'}";
        }
        JSONObject jsonObject = JSON.parseObject(jsonStr);
        log.info("blogDelete 请求end");
        return jsonObject;
    }
}
