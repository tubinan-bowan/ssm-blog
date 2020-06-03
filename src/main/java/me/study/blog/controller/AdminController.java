package me.study.blog.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

    private static Logger log = LoggerFactory.getLogger(AdminController.class);

    @RequestMapping("admin")
    public ModelAndView admin(){
        log.info("admin 请求start");
        log.error("admin 请求 error-------");
        ModelAndView modelAndView = new ModelAndView("admin/index");
        log.info("admin 请求end");
        return modelAndView;
    }

}
