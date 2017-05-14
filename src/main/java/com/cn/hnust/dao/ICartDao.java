package com.cn.hnust.dao;

import org.apache.ibatis.annotations.Param;

import com.cn.hnust.pojo.Cart;

public interface ICartDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Cart record);

    int insertSelective(Cart record);

    Cart selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Cart record);

    int updateByPrimaryKey(Cart record);

	Cart getByUser(@Param("userName") String userName);

	void updatePrice(@Param("cartId") Integer cartId);

	int updateAllPrice();
}