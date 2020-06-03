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
@Controller
public class BlogDetailController {

    private static Logger log = LoggerFactory.getLogger(BlogDetailController.class);

    @Autowired
    private BlogService blogService;
    @RequestMapping("blogDetail")
    public ModelAndView blogDetail(Integer id) {
        log.info("blogDetail 请求start");
        log.error("blogDetail 请求 error-------");
        Blog blog = blogService.getBlogById(id);
        log.info("json 查询博客，返回信息 {}", JSON.toJSON(blog).toString());
        ModelAndView mv = new ModelAndView("detail");
        mv.addObject("blog", blog);
        log.info("blogDetail 请求start");
        return mv;
    }
}
