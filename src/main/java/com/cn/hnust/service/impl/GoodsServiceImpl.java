package com.cn.hnust.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.hnust.dao.IGoodsDao;
import com.cn.hnust.pojo.Goods;
import com.cn.hnust.service.IGoodsService;
@Service("goodsService") 
public class GoodsServiceImpl implements IGoodsService {
	 @Resource  
	   private IGoodsDao goodsDao;

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

	
	
}
