package com.example.my.shop.mybatis.service;

import com.example.my.shop.mybatis.entity.TbUser;
import org.apache.ibatis.annotations.Param;


public interface TbUserService {

    int insert(TbUser record);

//    int deleteByPrimaryKey(Long id);
//
//    int insertSelective(TbUser record);
//
//    TbUser selectByPrimaryKey(Long id);
//
//    int updateByPrimaryKeySelective(TbUser record);
//
//    int updateByPrimaryKey(TbUser record);

    TbUser login(String email, String password);

}
