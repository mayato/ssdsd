package com.cn.hnust.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.hnust.dao.IStoreDao;
import com.cn.hnust.pojo.Store;
import com.cn.hnust.service.IStoreService;
@Service("storeService")
public class StoreServiceImpl implements IStoreService {
	
@Resource
public IStoreDao storeDao;
	@Override
	public List<Store> selectAll() {
		
		return storeDao.selectAll();
	}
	@Override
	public List<Store> selectByNameLike(String storeName) {
		
		return storeDao.selectByNameLike(storeName);
	}
	@Override
	public int deleteByPrimaryKey(Integer id) {
		
		return storeDao.deleteByPrimaryKey(id);
	}
	@Override
	public int insertSelective(Store store) {
		
		return storeDao.insertSelective(store);
	}
	@Override
	public int updateByPrimaryKeySelective(Store store) {
		
		return storeDao.updateByPrimaryKeySelective(store);
	}
	@Override
	public Store selectselectByPrimaryKey(Integer sid) {
		
		return storeDao.selectByPrimaryKey(sid);
	}

}
