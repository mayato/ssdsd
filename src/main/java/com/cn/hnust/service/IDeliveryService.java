package com.cn.hnust.service;

import java.util.List;

import com.cn.hnust.model.DeliveryDto;
import com.cn.hnust.pojo.Delivery;
import com.cn.hnust.pojo.DeliveryDetails;

public interface IDeliveryService {

	List<Delivery> getAll();

	List<Delivery> getbyuserName(String userName);

	int add(DeliveryDto deliveryDto);


}
