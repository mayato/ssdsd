package com.cn.hnust.service;

import java.util.List;

import com.cn.hnust.pojo.OrderDetails;

public interface IOrderDetailService {

	List<OrderDetails> getByOrderId(Integer id);

}
