package com.example.my.shop.mybatis.controller;

import com.example.my.shop.mybatis.entity.TbUser;
import com.example.my.shop.mybatis.service.TbUserService;
import com.example.my.shop.mybatis.service.impl.TbUserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;


@WebServlet("/test")
public class TestController extends HttpServlet {

    TbUserService tbUserService = new TbUserServiceImpl();


    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        TbUser tbUser=new TbUser();
        tbUser.setId(0L);
        tbUser.setUsername("Test");
        tbUser.setPassword("123456");
        tbUser.setPhone("13816000987");
        tbUser.setEmail("test@qq.com");
        tbUser.setCreated(new Date());
        tbUser.setUpdated(new Date());
        int insert = tbUserService.insert(tbUser);
        System.out.println(String.format("输出：%s",insert));
    }


}
