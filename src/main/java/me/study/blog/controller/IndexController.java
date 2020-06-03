package me.study.blog.controller;

import com.alibaba.fastjson.JSON;
import me.study.blog.entity.Blog;
import me.study.blog.service.iml.BlogService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
@Controller
public class IndexController {

    private static Logger log = LoggerFactory.getLogger(IndexController.class);

    @Autowired
    private BlogService blogService;

    @RequestMapping("/")
    protected ModelAndView doGet(HttpServletRequest req, HttpServletResponse resp) {
        log.info("/ 请求start");
        log.error("/ 请求 error-------");
        List<Blog> blogList = blogService.getBlogList();
        log.info("json 查询博客，返回信息 {}", JSON.toJSON(blogList).toString());
        ModelAndView modelAndView = new ModelAndView("index");
        modelAndView.addObject("List", blogList);
        log.info("/ 请求end");
        return modelAndView;
    }
}
