package com.example.my.shop.mybatis;

import com.example.my.shop.mybatis.entity.User;
import com.example.my.shop.mybatis.mapper.UserMapper;
import com.example.my.shop.mybatis.utils.MybatisUtils;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import java.util.Date;

public class TestMybatis {

    @Test
    public void insertGetId(){

        /** 向数据库中增加数据 */
        SqlSession sqlSession = MybatisUtils.getSqlSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);

        User user=new User();
        user.setId(0);
        user.setAge(0);
        user.setEmail("601521821@qq.com");
        user.setGender("男");
        user.setName("小明");
        user.setPassword("123456");
        user.setCreated(new Date());
        System.err.println("user:"+user);

        userMapper.insertUserTwo(user);
        sqlSession.commit();//默认事务关闭，需要手动提交事务
        sqlSession.close();
        System.out.println(user.getId());
        System.out.println();
    }


}
