package com.example.my.shop.mybatis.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.UnsupportedEncodingException;

public class EncodingHttpServletRequest extends HttpServletRequestWrapper {
    private HttpServletRequest request;
    private String encoding;

    public EncodingHttpServletRequest(HttpServletRequest request) {
        super(request);
        this.request = request;
    }

    public EncodingHttpServletRequest(HttpServletRequest request, String encoding) {
        super(request);
        this.request = request;
        this.encoding = encoding;
    }

    @Override
    public String getParameter(String name) {
        String value = request.getParameter(name);
        if (null != value) {
            try {
                // tomcat默认以ISO8859-1处理GET传来的参数。把tomcat上的值用ISO8859-1获取字节流，再转换成UTF-8字符串
                value = new String(value.getBytes("ISO8859-1"), encoding);
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        return value;
    }

}
