package com.example.my.shop.mybatis.utils;


import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EncodingFilter implements Filter {
    private String encoding;

    public void init(FilterConfig fConfig) throws ServletException {
        encoding = fConfig.getInitParameter("encoding");
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httprequest = (HttpServletRequest) request;
        HttpServletResponse httprresponse = (HttpServletResponse) response;
        if ("GET".equals(httprequest.getMethod())) {
            EncodingHttpServletRequest wrapper = new EncodingHttpServletRequest(httprequest, encoding);
            chain.doFilter(wrapper, response);
            return;
        } else {
            request.setCharacterEncoding(encoding);
            response.setContentType("text/html;charset=" + encoding);
            chain.doFilter(httprequest, httprresponse);
            return;
        }
    }

    public void destroy() {

    }

}
