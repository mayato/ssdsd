package com.cn.hnust.dao;

import com.cn.hnust.pojo.Admin;

public interface IAdminDao {
    int deleteByPrimaryKey(String name);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(String name);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);
}