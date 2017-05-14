package com.cn.hnust.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

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
	@SuppressWarnings("null")
	@Override
	@Transactional
	public int insertSelective(Store store) {
		
		List<Store> list = storeDao.selectBygoodsIdAndwarehouseId(store.getGoodsId(),store.getWarehouseId());
		if(list!=null&&list.size()!=0){
			return 0;
		}
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
	@Override
	public List<Store> getWithOrder(Integer goodsId, Integer number) {
		
		return storeDao.getWithOrder(goodsId,number);
	}

}
