package com.cn.hnust.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cn.hnust.pojo.DeliveryDetails;

public interface IDeliveryDetailsDao {
    int deleteByPrimaryKey(Integer id);

    int insert(DeliveryDetails record);

    int insertSelective(DeliveryDetails record);

    DeliveryDetails selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DeliveryDetails record);

    int updateByPrimaryKey(DeliveryDetails record);

	List<DeliveryDetails> getBydeliveryId(@Param("deliveryId")Integer deliveryId);
}