package com.cn.hnust.service;

import java.util.List;

import com.cn.hnust.pojo.DeliveryDetails;

public interface IDeliveryDetailsService {

	List<DeliveryDetails> getBydeliveryId(Integer id);

}
