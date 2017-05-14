package com.cn.hnust.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.hnust.dao.IDeliveryDetailsDao;
import com.cn.hnust.pojo.DeliveryDetails;
import com.cn.hnust.service.IDeliveryDetailsService;
@Service("deliveryDetailsService")
public class DeliveryDetailsServiceImpl implements IDeliveryDetailsService{

	@Autowired
	private IDeliveryDetailsDao deliveryDetailsDao;
	@Override
	public List<DeliveryDetails> getBydeliveryId(Integer id) {
	
		return deliveryDetailsDao.getBydeliveryId(id);
	}

}
