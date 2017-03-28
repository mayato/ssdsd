package com.cn.hnust.service;

import com.cn.hnust.pojo.Warehouse;

public interface IWarehouseService {

	Warehouse selectByPrimaryKey(Integer warehouseId);

}
