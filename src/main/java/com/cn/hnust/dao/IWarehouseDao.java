package com.cn.hnust.dao;

import com.cn.hnust.pojo.Warehouse;

public interface IWarehouseDao {
    int deleteByPrimaryKey(Integer warehouseId);

    int insert(Warehouse record);

    int insertSelective(Warehouse record);

    Warehouse selectByPrimaryKey(Integer warehouseId);

    int updateByPrimaryKeySelective(Warehouse record);

    int updateByPrimaryKey(Warehouse record);
}