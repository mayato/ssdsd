package com.cn.hnust.service;

import java.util.List;

import com.cn.hnust.pojo.Order;

public interface IOrderService {

	int add(String userName, Double price);

	List<Order> getbyuserName(String userName);

	List<Order> getAll();

	int deleteByPrimaryKey(Integer id);

	Order getByid(Integer id);

}
