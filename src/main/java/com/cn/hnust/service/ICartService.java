package com.cn.hnust.service;

import com.cn.hnust.pojo.Cart;

public interface ICartService {

	Cart getByUser(String  userName);

	int insert(Cart cart);

	int updateByPrimaryKeySelective(Cart byUser);
	
	void updatePrice(Integer id);

}
