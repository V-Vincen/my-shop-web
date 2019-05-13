package com.example.my.shop.mybatis.mapper;

import com.example.my.shop.mybatis.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    User selectById(Integer id);

    int insertUser(User user);

    void insertUserTwo(User user);

    /**多个参数可以使用集合的 方式传递，map等*/
    User findUser(@Param("id")Integer id, @Param("email") String email);
}
