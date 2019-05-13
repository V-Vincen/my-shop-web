package com.example.my.shop.mybatis.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class User implements Serializable {
    private Integer id;
    private Integer age;
    private String email;
    private String gender;
    private String name;
    private String password;
    private Date created;
}

