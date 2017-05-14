package com.cn.hnust.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cn.hnust.model.CartDetailModel;
import com.cn.hnust.pojo.CartDetails;

public interface ICartDetailsDao {
    int deleteByPrimaryKey(Integer id);

    int insert(CartDetails record);

    int insertSelective(CartDetails record);

    CartDetails selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CartDetails record);

    int updateByPrimaryKey(CartDetails record);

	List<CartDetailModel> getByCartID(@Param("cartId") Integer cartId);

	CartDetails getByCartIDAndGoodsID(@Param("cartId") Integer cartId,
			@Param("goodsId") Integer goodsId);

	int updateprice(@Param("goodsId")Integer goodsId, 
		@Param("price")	Double price);

	
	
}