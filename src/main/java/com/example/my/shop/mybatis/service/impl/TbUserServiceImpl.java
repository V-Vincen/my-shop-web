package com.example.my.shop.mybatis.service.impl;

import com.example.my.shop.mybatis.entity.TbUser;
import com.example.my.shop.mybatis.mapper.TbUserMapper;
import com.example.my.shop.mybatis.service.TbUserService;
import com.example.my.shop.mybatis.utils.MybatisUtils;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.DigestUtils;

import java.util.List;

public class TbUserServiceImpl implements TbUserService{

    private static final Logger logger = LoggerFactory.getLogger(TbUserServiceImpl.class);

    SqlSession sqlSession = MybatisUtils.getSqlSession();
    TbUserMapper tbUserMapper = sqlSession.getMapper(TbUserMapper.class);

    public int insert(TbUser record) {
        int insert = tbUserMapper.insert(record);
        sqlSession.commit();
        return insert;
    }

    public TbUser login(String email, String password) {
        logger.debug("调用 getByEmail(), email:{} password:{}", email, password);

        TbUser tbUser = tbUserMapper.getByEmail(email);
        sqlSession.commit();//默认事务关闭，需要手动提交事务
        //sqlSession.close();

        if (tbUser != null) {
            String md5Pwd = DigestUtils.md5DigestAsHex(password.getBytes());
            if (md5Pwd.equals(tbUser.getPassword())) {
                return tbUser;
            }
        }
        return null;
    }


    public List<TbUser> findAll(){
        List<TbUser> all = tbUserMapper.findAll();
        return all;
    }
}
