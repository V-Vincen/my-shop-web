package com.example.my.shop.mybatis.mapper;
import java.util.List;

import com.example.my.shop.mybatis.entity.TbUser;
import org.apache.ibatis.annotations.Param;

public interface TbUserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TbUser record);

    int insertSelective(TbUser record);

    TbUser selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TbUser record);

    int updateByPrimaryKey(TbUser record);

    TbUser getByEmail(@Param("email") String email);

    List<TbUser> findAll();


}