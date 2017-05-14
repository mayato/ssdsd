package com.cn.hnust.service.impl;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.hnust.dao.ICartDao;
import com.cn.hnust.dao.ICartDetailsDao;
import com.cn.hnust.dao.IGoodsDao;
import com.cn.hnust.dao.IOrderDao;
import com.cn.hnust.dao.IOrderDetailsDao;
import com.cn.hnust.dao.IUserDao;
import com.cn.hnust.model.CartDetailModel;
import com.cn.hnust.pojo.Cart;
import com.cn.hnust.pojo.Goods;
import com.cn.hnust.pojo.Order;
import com.cn.hnust.pojo.OrderDetails;
import com.cn.hnust.pojo.User;
import com.cn.hnust.service.IOrderService;

@Service("orderService")
public class OrderServiceImpl implements IOrderService{

	@Autowired
	private IOrderDao orderDao;
	@Autowired
	private IOrderDetailsDao orderDetailsDao;
	@Autowired
	private ICartDao cartDao;
	@Autowired
	private ICartDetailsDao cartDetailsDao;
	@Autowired
	private IUserDao userDao;
	@Autowired
	private IGoodsDao goodsDao;

	
    @Transactional
	@Override
	public int add(String userName,Double price1) {
	    Cart cart1 = cartDao.getByUser(userName);
	    cartDao.updatePrice(cart1.getId());
		Cart cart = cartDao.getByUser(userName);
		System.out.println("旧的价格"+price1.toString());
		System.out.println("新的价格"+cart.getPrice().toString());
		//精度
		double d=0.0001;
		if(price1.doubleValue()-cart.getPrice().doubleValue()<-d||price1.doubleValue()-cart.getPrice().doubleValue()>d)
		{
			
			return -1;
		}
		
		/*Cart cart = cartDao.getByUser(userName);*/
		Double price = cart.getPrice();
		User user = userDao.selectByPrimaryKey(userName);
		//新建order
		Order order = new Order();
		order.setPrice(price);
		order.setUserName(userName);
		order.setState(0);
		order.setOrderTime(new Date());
		order.setOrderAddress(user.getUserAddress());
		int i = orderDao.insert(order);
		//获取cartdetail
		List<CartDetailModel> cartDetailList = cartDetailsDao.getByCartID(cart.getId());
		//填充details
		int count=0;
		for (CartDetailModel cartDetailModel : cartDetailList) {
			OrderDetails details = new OrderDetails();
			details.setGoodsId(cartDetailModel.getGoodsId());
			details.setGoodsName(cartDetailModel.getGoodsName());
			details.setGoodsPrice(cartDetailModel.getGoodsPrice());
			details.setNumber(cartDetailModel.getNumber());
			details.setOrderId(order.getId());
			details.setTotalPrice(cartDetailModel.getTotalPrice());
			details.setGoodsUrl(cartDetailModel.getGoodsUrl());
			count += orderDetailsDao.insert(details);
			cartDetailsDao.deleteByPrimaryKey(cartDetailModel.getId());
			
			cartDetailModel.getGoodsId();
			cartDetailModel.getNumber();
			Goods goods = goodsDao.selectByPrimaryKey(cartDetailModel.getGoodsId());
			int num=goods.getSalenum();
			num+=cartDetailModel.getNumber();
			goods.setSalenum(num);
			int count1 = goodsDao.updateByPrimaryKeySelective(goods);
		}
		
		user.setUserPoints(user.getUserPoints()+price.intValue());
		userDao.updateByPrimaryKeySelective(user);
		cartDao.deleteByPrimaryKey(cart.getId());
		return 1;
	}


	@Override
	public List<Order> getbyuserName(String userName) {
		
		return orderDao.getbyuserName(userName);
	}


	@Override
	public List<Order> getAll() {
		
		return orderDao.getAll();
	}

    @Transactional
	@Override
	public int deleteByPrimaryKey(Integer id) {
		orderDao.deleteByPrimaryKey(id);
		int i = orderDetailsDao.deleteByOrderId(id);
		return i;
	}


	@Override
	public Order getByid(Integer id) {
		// TODO Auto-generated method stub
		return orderDao.selectByPrimaryKey(id);
	}
}
