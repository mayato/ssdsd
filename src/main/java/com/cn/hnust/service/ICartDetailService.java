package com.cn.hnust.service;

import java.util.List;

import com.cn.hnust.model.CartDetailModel;
import com.cn.hnust.pojo.CartDetails;

public interface ICartDetailService {

	List<CartDetailModel> getByCartID(Integer cartId);

	int updateByPrimaryKeySelective(CartDetails cartDetails,String userName);

	CartDetails selectByPrimaryKey(Integer id);

	int deleteByPrimaryKey(Integer id);

	int insert(CartDetails cartDetails);

	CartDetails getByCartIDAndGoodsID(Integer cartId, Integer goodsId);

}
