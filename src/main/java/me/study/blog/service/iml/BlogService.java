package me.study.blog.service.iml;

import com.alibaba.fastjson.JSON;
import me.study.blog.controller.AdminController;
import me.study.blog.dao.BlogMapper;
import me.study.blog.entity.Blog;
import me.study.blog.service.IBlogService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class BlogService implements IBlogService {

    private static Logger log = LoggerFactory.getLogger(BlogService.class);

    @Autowired
    private BlogMapper blogMapper;

    @Override
    public List<Blog> getBlogList() {
        List<Blog> blogList = blogMapper.getBlogList();
        log.info("BlogService 返回博客列表数据 {}", JSON.toJSON(blogList).toString());
        return blogList;
    }

    @Override
    public Blog getBlogById(int id) {
        Blog blog = blogMapper.getBlogById(id);
        log.info("BlogService 返回博客数据 {}", JSON.toJSON(blog).toString());
        return blog;
    }

    @Override
    public int insert(String title, String content) {
        Blog blog = new Blog();
        blog.setTitle(title);
        blog.setContent(content);
        int result = blogMapper.insert(blog);
        log.info("BlogService 返回博客插入情况 {}", result);
        return result;
    }

    @Override
    public int delete(int id) {
        int result = blogMapper.delete(id);
        log.info("BlogService 返回博客删除情况 {}", result);
        return result;
    }

}
