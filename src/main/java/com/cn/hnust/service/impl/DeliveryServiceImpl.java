package com.cn.hnust.service.impl;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.hnust.dao.IDeliveryDao;
import com.cn.hnust.dao.IDeliveryDetailsDao;
import com.cn.hnust.dao.IOrderDao;
import com.cn.hnust.model.DeliveryDto;
import com.cn.hnust.pojo.Delivery;
import com.cn.hnust.pojo.DeliveryDetails;
import com.cn.hnust.pojo.Order;
import com.cn.hnust.service.IDeliveryService;

/**
 * @author xs
 *
 */
@Service("deliveryService")
public class DeliveryServiceImpl implements IDeliveryService{

	@Autowired
	private IDeliveryDao deliveryDao;
	@Autowired
	private IDeliveryDetailsDao deliveryDetailsDao;
	@Autowired
	private IOrderDao orderDao;
	@Override
	public List<Delivery> getAll() {
		
		return deliveryDao.getAll();
	}

	@Override
	public List<Delivery> getbyuserName(String userName) {
		// TODO Auto-generated method stub
		return deliveryDao.getbyuserName(userName);
	}
   @Transactional
	@Override
	public int add(DeliveryDto deliveryDto) {
		
		Order order = orderDao.selectByPrimaryKey(deliveryDto.getId());
		Delivery delivery = new Delivery();
		delivery.setOrderAddress(order.getOrderAddress());
		delivery.setOrderId(order.getId());
		delivery.setPrice(order.getPrice());
		delivery.setTime(new Date());
		delivery.setUserName(order.getUserName());
		deliveryDao.insert(delivery);
		List<DeliveryDetails> list = deliveryDto.getList();
		
		for (DeliveryDetails deliveryDetails : list) {
			deliveryDetails.setDeliveryId(delivery.getId());
			deliveryDetailsDao.insert(deliveryDetails);
		}
		order.setState(1);
		int i = orderDao.updateByPrimaryKey(order);
		return i;
	}

}
