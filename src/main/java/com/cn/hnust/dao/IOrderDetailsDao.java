package com.cn.hnust.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cn.hnust.pojo.OrderDetails;

public interface IOrderDetailsDao {
    int deleteByPrimaryKey(Integer id);

    int insert(OrderDetails record);

    int insertSelective(OrderDetails record);

    OrderDetails selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrderDetails record);

    int updateByPrimaryKey(OrderDetails record);

	int deleteByOrderId(@Param("id")Integer id);

	List<OrderDetails> getByOrderId(@Param("orderId") Integer orderId);
}