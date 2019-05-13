package com.example.my.shop.mybatis.controller;

import com.example.my.shop.mybatis.entity.TbUser;
import com.example.my.shop.mybatis.service.TbUserService;
import com.example.my.shop.mybatis.service.impl.TbUserServiceImpl;
import com.example.my.shop.mybatis.utils.CookieUtils;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginController extends HttpServlet {
    public static final String SESSION_USER = "sessionUser";

    public static final String COOKIE_NAME_USER_INFO = "userInfo";

    TbUserService tbUserService = new TbUserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取游览器中的COOKIE用户
        String userInfo = CookieUtils.getCookieValue(req, COOKIE_NAME_USER_INFO);
        if (!StringUtils.isBlank(userInfo)) {
            String[] userInfoArray = userInfo.split(":");
            String email = userInfoArray[0];
            String password = userInfoArray[1];
            req.setAttribute("email", email);
            req.setAttribute("password", password);
            req.setAttribute("isRemember", true);
        }
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        boolean isRemember = req.getParameter("isRemember") == null ? false : true;

        //用户选择不记住
        if (!isRemember) {
            CookieUtils.deleteCookie(req, resp, COOKIE_NAME_USER_INFO);
        }
        TbUser tbUser = tbUserService.login(email, password);
        //登录失败
        if (tbUser == null) {
            req.setAttribute("message", "用户密码错误");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        } else {//登陆成功
            if (isRemember) {
                //用户信息存储一周
                CookieUtils.setCookie(req, resp, COOKIE_NAME_USER_INFO, String.format("%s:%s", email, password), 7 * 24 * 60 * 60);
            }
            //将登陆信息放入回话
            req.getSession().setAttribute(SESSION_USER, tbUser);
            //resp.sendRedirect("WEB-INF/views/main.jsp");
            resp.sendRedirect("/main.jsp");
        }
    }
}
