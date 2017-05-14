package com.cn.hnust.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.hnust.dao.ICartDao;
import com.cn.hnust.dao.ICartDetailsDao;
import com.cn.hnust.dao.IGoodsDao;
import com.cn.hnust.pojo.CartDetails;
import com.cn.hnust.pojo.Goods;
import com.cn.hnust.service.IGoodsService;
@Service("goodsService") 
public class GoodsServiceImpl implements IGoodsService {
	 @Resource  
	   private IGoodsDao goodsDao;
	 @Autowired
	 private ICartDetailsDao cartDetailsDao;
	 @Autowired
	 private ICartDao cartDao;

	@Override
	public List<Goods> getgoodsDesc() {
		
		return goodsDao.getgoodsDesc();
	}

	@Override
	public Goods selectselectByPrimaryKey(Integer goodsId) {
		
		return goodsDao.selectByPrimaryKey(goodsId);
	}

	@Override
	public List<Goods> getgoodschoose(String type) {
		
		return goodsDao.selectByType(type);
	}

	@Override
	public List<Goods> selectByNameLike(String name) {
		
		return goodsDao.selectByNameLike(name);
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {		
		return goodsDao.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Goods goods) {
		
		return goodsDao.insert(goods);
	}
  @Transactional
	@Override
	public int updateByPrimaryKeySelective(Goods goods) {
		
	        cartDetailsDao.updateprice(goods.getGoodsId(),goods.getPrice());
	        int i = goodsDao.updateByPrimaryKeySelective(goods);
		return i;
	}

	
	
}
