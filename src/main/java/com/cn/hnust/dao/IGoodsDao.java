package com.cn.hnust.dao;

import java.util.List;

import com.cn.hnust.pojo.Goods;

public interface IGoodsDao {
    int deleteByPrimaryKey(Integer goodsId);

    int insert(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(Integer goodsId);
    
    List<Goods> getgoodsDesc();
    
    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKey(Goods record);

	List<Goods> selectByType(String type);
}