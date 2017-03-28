package com.cn.hnust.service;

import java.util.List;

import com.cn.hnust.pojo.Store;

public interface IStoreService {
	public List<Store> selectAll();

	public List<Store> selectByNameLike(String storeName);

	public int deleteByPrimaryKey(Integer id);

	public int insertSelective(Store store);

	public int updateByPrimaryKeySelective(Store store);

	public Store selectselectByPrimaryKey(Integer id);

}
