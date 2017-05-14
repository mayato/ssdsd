package com.cn.hnust.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.hnust.dao.ICartDao;
import com.cn.hnust.dao.ICartDetailsDao;
import com.cn.hnust.model.CartDetailModel;
import com.cn.hnust.pojo.Cart;
import com.cn.hnust.pojo.CartDetails;
import com.cn.hnust.service.ICartDetailService;

@Service("cartDetailService")
public class CartDetailServiceImpl implements ICartDetailService{
	@Autowired
	private ICartDetailsDao cartDetailsDao;
	@Autowired
	private ICartDao cartDao;

	@Override
	public List<CartDetailModel> getByCartID(Integer cartId) {
		
		return cartDetailsDao.getByCartID(cartId);
	}
   @Transactional
	@Override
	public int updateByPrimaryKeySelective(CartDetails cartDetails,String userName) {
		
	   int count = cartDetailsDao.updateByPrimaryKeySelective(cartDetails);
		
	   cartDao.updatePrice(cartDetails.getCartId());
		return count; 
	}

	@Override
	public CartDetails selectByPrimaryKey(Integer id) {
	
		return cartDetailsDao.selectByPrimaryKey(id);
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		
		return cartDetailsDao.deleteByPrimaryKey(id);
	}
	@Override
	public int insert(CartDetails cartDetails) {
		
		return cartDetailsDao.insert(cartDetails);
	}
	@Override
	public CartDetails getByCartIDAndGoodsID(Integer cartId, Integer goodsId) {
		
		return cartDetailsDao.getByCartIDAndGoodsID(cartId,goodsId);
	}

}
