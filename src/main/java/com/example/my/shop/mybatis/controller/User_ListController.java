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
import java.util.List;


@WebServlet(value = "/user_list")
public class User_ListController extends HttpServlet {

    private TbUserService tbUserService = new TbUserServiceImpl();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<TbUser> all = tbUserService.findAll();
        req.setAttribute("tbUsers",all);
        req.getRequestDispatcher("/user_list.jsp").forward(req, resp);
    }




}
