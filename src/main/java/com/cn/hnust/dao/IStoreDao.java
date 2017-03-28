package com.cn.hnust.dao;

import java.util.List;

import com.cn.hnust.pojo.Store;

public interface IStoreDao {
    /*int deleteByPrimaryKey(Integer sId);

    int insert(Store record);

    int insertSelective(Store record);

    Store selectByPrimaryKey(Integer sId);

    int updateByPrimaryKeySelective(Store record);

    int updateByPrimaryKey(Store record);*/
	Store selectByPrimaryKey(Integer sId);
	int updateByPrimaryKeySelective(Store store);
	int insertSelective(Store store);
	List<Store> selectAll();
	List<Store> selectByNameLike(String storeName);
	int deleteByPrimaryKey(Integer id);
}