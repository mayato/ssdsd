package com.cn.hnust.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.hnust.dao.ICartDao;
import com.cn.hnust.pojo.Cart;
import com.cn.hnust.service.ICartService;

@Service("cartServie")
public class CartServiceImpl implements ICartService {
	
	@Autowired
	private ICartDao cartDao;

	@Override
	public Cart getByUser(String userName) {
		
		return cartDao.getByUser(userName);
	}

	@Override
	public int insert(Cart cart) {
	
		return cartDao.insert(cart);
	}

	@Override
	public int updateByPrimaryKeySelective(Cart byUser) {
		
		return cartDao.updateByPrimaryKeySelective(byUser);
	}

	@Override
	public void updatePrice(Integer id) {
		
		cartDao.updatePrice(id);
	}


	
	
	
    

}
