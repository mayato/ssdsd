package com.cn.hnust.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.hnust.dao.IWarehouseDao;
import com.cn.hnust.pojo.Warehouse;
import com.cn.hnust.service.IWarehouseService;
@Service("warehouseService")
public class warehouseServiceImpl  implements IWarehouseService{
@Resource
private IWarehouseDao warehouseDao;

@Override
public Warehouse selectByPrimaryKey(Integer warehouseId) {
	// TODO Auto-generated method stub
	return  warehouseDao.selectByPrimaryKey(warehouseId);
}

}
