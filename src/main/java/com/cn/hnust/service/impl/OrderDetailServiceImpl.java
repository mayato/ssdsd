package com.cn.hnust.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.hnust.dao.IOrderDetailsDao;
import com.cn.hnust.pojo.OrderDetails;
import com.cn.hnust.service.IOrderDetailService;
@Service("orderDetailService")
public class OrderDetailServiceImpl implements IOrderDetailService {
	@Autowired
	private IOrderDetailsDao orderDetailsDao;

	@Override
	public List<OrderDetails> getByOrderId(Integer id) {
		
		return orderDetailsDao.getByOrderId(id);
	}

}
