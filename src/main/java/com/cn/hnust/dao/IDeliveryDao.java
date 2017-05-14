package com.cn.hnust.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cn.hnust.pojo.Delivery;

public interface IDeliveryDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Delivery record);

    int insertSelective(Delivery record);

    Delivery selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Delivery record);

    int updateByPrimaryKey(Delivery record);

	List<Delivery> getAll();

	List<Delivery> getbyuserName(@Param("userName") String userName);
}