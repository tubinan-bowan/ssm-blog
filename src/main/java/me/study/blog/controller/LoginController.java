package me.study.blog.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import me.study.blog.dao.UserMapper;
import me.study.blog.entity.User;
import me.study.blog.service.iml.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
@Controller
@RequestMapping("login")
public class LoginController {

    private static Logger log = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    UserService userService;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView loginGet(){
        log.info("login GET 请求start");
        log.error("login GET 请求 error-------");
        ModelAndView modelAndView = new ModelAndView("login");
        log.info("login GET 请求end");
        return modelAndView;
    }

    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public JSONObject loginPost(String name, String password, HttpServletRequest httpServletRequest) {
        log.info("login POST 请求start");
        log.error("login POST 请求 error-------");
        User user = userService.getUserByName(name);
        String code = "1";
        String msg = "登录失败";
        String jsonStr = null;
        if (user == null){
            msg = "用户不存在";
            return returnResult(code, msg);
        }
        if(user.getPassword().equals(password)){
            code = "0";
            msg = "登陆成功";
            HttpSession session = httpServletRequest.getSession();
            session.setAttribute("user", user);
            return returnResult(code, msg);
        }else{
            return returnResult(code, msg);
        }
    }
    public JSONObject returnResult(String code, String msg){
        String str = "{code:'"+code+"', msg:'"+msg+"'}";
        JSONObject jsonObject = JSON.parseObject(str);
        log.info("login POST 请求end");
        return jsonObject;
    }
}
