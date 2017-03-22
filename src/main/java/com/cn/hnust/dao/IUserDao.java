package com.cn.hnust.dao;

import com.cn.hnust.pojo.User;

public interface IUserDao {
    int deleteByPrimaryKey(String userName);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String userName);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}