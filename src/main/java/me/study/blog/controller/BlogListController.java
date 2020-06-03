package me.study.blog.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import me.study.blog.entity.Blog;
import me.study.blog.service.iml.BlogService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class BlogListController {

    private static Logger log = LoggerFactory.getLogger(BlogListController.class);

    @Autowired
    private BlogService blogService;

    @RequestMapping("index")
    public ModelAndView indexGet()  {
        log.info("index 请求start");
        log.error("index 请求 error-------");
        List<Blog> blogList = blogService.getBlogList();
        log.info("index 查询博客，返回信息 {}", JSON.toJSON(blogList).toString());
        ModelAndView mv = new ModelAndView("index");
        mv.addObject("List", blogList);
        log.info("index 请求end");
        return mv;
    }


    @RequestMapping("blogList")
    @ResponseBody
    public JSONObject indexPost(){
        log.info("blogList 请求start");
        log.error("blogList 请求 error-------");
        List<Blog> blogList = blogService.getBlogList();
        String strj = JSON.toJSON(blogList).toString();
        String jsonStr = "{code:'0', msg:'查询成功', data:"+strj+"}";//{code:'0', msg:'查询成功', data:'strj'}
        JSONObject jsonObject = JSON.parseObject(jsonStr);
        log.info("blogList 查询博客，返回信息 {}", jsonObject);
        log.info("blogList 请求end");
        return jsonObject;
    }
}
