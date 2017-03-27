package com.cn.hnust.service;

import java.util.List;

import com.cn.hnust.pojo.Goods;


public interface IGoodsService {
	public List<Goods> getgoodsDesc();
	public  Goods selectselectByPrimaryKey(Integer goodsId);
	public List<Goods> getgoodschoose(String type);
	public List<Goods> selectByNameLike(String name);
	public int deleteByPrimaryKey(Integer id);
	public int insert(Goods goods);
	public int updateByPrimaryKeySelective(Goods goods);
}
